import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../providers/providers.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';
import 'pages.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State createState() => CharactersPageState();
}

class CharactersPageState extends State<CharactersPage> {
  CharactersPageState({Key? key});

  final ScrollController listScrollController = ScrollController();
  bool isLoading = false;

  //Searchbar
  bool _isSearching = false;
  String _textSearch = "";
  TextEditingController searchBarTec = TextEditingController();
  FocusNode searchBarFocusNode = FocusNode();

  late CharactersProvider charactersProvider;
  late ChatRoomsProvider chatRoomsProvider;

  @override
  void initState() {
    super.initState();
    charactersProvider = context.read<CharactersProvider>();
    chatRoomsProvider = context.read<ChatRoomsProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    CharactersProvider friendsProvider = context.watch<CharactersProvider>();
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        //background
        Positioned(
          width: screenSize.width,
          height: screenSize.height,
          child: const Image(
            image: AssetImage(AppConstants.assetChatterBackground),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: _isSearching
                ? _buildSearchBar()
                : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Text(
                      Intl.message('chatterTitle'),
                      style: const TextStyle(
                        color: ColorConstants.appbarTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  _isSearching
                  ? Icons.close
                  : Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                    if (_isSearching) {
                      searchBarFocusNode.requestFocus();
                    } else {
                      searchBarFocusNode.unfocus();
                      searchBarTec.clear();
                      _textSearch = "";
                    }
                  });
                },
              ),
            ],
          ),
          body: SafeArea(
            child: WillPopScope(
              onWillPop: _onBackPress,
              child: Stack(
                children: <Widget>[
                  // List
                  Column(
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (BuildContext context) {
                            List<Character> characters = friendsProvider.characters;

                            if (characters.isEmpty) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return _buildAddButton(context);
                                },
                                itemCount: 1,
                              );
                            } else {
                              List<Character> filteredCharacters =
                              characters.where((character) =>
                              _textSearch.isEmpty || character.botName.toLowerCase().contains(_textSearch.toLowerCase())).toList();

                              if (filteredCharacters.isNotEmpty) {
                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 50),
                                  itemBuilder: (context, index) {
                                    if (index == filteredCharacters.length) {
                                      return _buildAddButton(context);
                                    } else {
                                      return buildItem(context, filteredCharacters[index]);
                                    }
                                  },
                                  itemCount: filteredCharacters.length + 1,
                                  controller: listScrollController,
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    Intl.message("noChatterFound"),
                                    style: const TextStyle(
                                      fontSize: 23,
                                      color: ColorConstants.themeColor,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "MouldyCheeseRegular"
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  // Loading
                  Positioned(
                    child: isLoading ? const LoadingView() : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchBarTec.dispose();
    listScrollController.removeListener(() { });
  }

  Future<void> _init() async {
    // initialize something
  }

  Future<bool> _onBackPress() {
    if(_isSearching){
      searchBarFocusNode.unfocus();
      searchBarTec.clear();
      _textSearch = "";
      setState(() {
        _isSearching = false;
      });
    } else {
      _openExitDialog();
    }
    return Future.value(false);
  }

  Future<void> _openExitDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return exitDialog(context);
        })) {
      case OnExitDialogClicked.onCancelClicked:
        break;
      case OnExitDialogClicked.onYesClicked:
        SystemNavigator.pop();
        break;
    }
  }

  Future<void> _openFriendDialog(BuildContext context, Character friend) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return friendDialog(context,friend.botName);
        })) {
      case OnFriendDialogClicked.onEditClicked:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterCreationPage(
              arguments: CharacterCreationPageArguments(character: friend),
            ),
          ),
        );
        break;
      case OnFriendDialogClicked.onDeleteClicked:
        await _openDeleteCheckDialog(context, friend.id!);
        break;
    }
  }

  Future<void> _openDeleteCheckDialog(BuildContext context, String characterId) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return deleteCharacterDialog(context);
        })) {
      case OnDeleteCharacterDialogClicked.onCancelClicked:
        break;
      case OnDeleteCharacterDialogClicked.onYesClicked:
        final characterProvider = Provider.of<CharactersProvider>(context, listen: false);
        final chatRoomsProvider = Provider.of<ChatRoomsProvider>(context, listen: false);
        await characterProvider.deleteCharacter(characterId);
        await chatRoomsProvider.updateChatRooms();
        break;
    }
  }

  Widget _buildSearchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.search),
        const SizedBox(width: 5),
        Expanded(
          child: TextFormField(
            focusNode: searchBarFocusNode,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.search,
            controller: searchBarTec,
            onChanged: (value) {
              setState(() {
                _textSearch = value;
              });
            },
            decoration: InputDecoration.collapsed(
              hintText: Intl.message("searchChatter"),
              hintStyle: const TextStyle(fontSize: 15, color: ColorConstants.weakGreyColor),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem(BuildContext context, Character? friend) {
    if (friend != null) {
      return Column(
        children: [
          Ink(
            color: Colors.white,
            child: InkWell(
              onLongPress: () async {
                await _openFriendDialog(context, friend);
              },
              onTap: () {
                if (Utilities.isKeyboardShowing()) {
                  Utilities.closeKeyboard(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterProfilePage(
                      arguments: CharacterProfilePageArguments(
                        characterId: friend.id!,
                        comingFromChatPage: false
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      clipBehavior: Clip.hardEdge,
                      child: friend.photoBLOB.isNotEmpty
                          ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.memory(
                            friend.photoBLOB,
                            fit: BoxFit.cover,
                            errorBuilder: (context, object, stackTrace) {
                              return const Icon(
                                Icons.account_circle_rounded,
                                size: 50,
                                color: ColorConstants.greyColor,
                              );
                            },
                          )
                      )
                          : const Icon(
                        Icons.account_circle,
                        size: 50,
                        color: ColorConstants.greyColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            friend.botName,
                            style: const TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 0.1,
            thickness: 0.5,
            color: Colors.grey[300],
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildAddButton(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterCreationPage(
                arguments: CharacterCreationPageArguments(
                    character: Character.emptyCharacter()
                ),
              ),
            ),
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.add_circle_outline_sharp,
            size: 24.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}

