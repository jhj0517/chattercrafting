import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../utils/utils.dart';
import '../models/models.dart';
import '../pages/chat_page.dart';
import '../providers/chat_rooms_provider.dart';
import '../constants/constants.dart';
import '../widgets/custom_dialogs.dart';

class ChatRoomsPage extends StatefulWidget {
  const ChatRoomsPage({Key? key}) : super(key: key);

  @override
  ChatRoomsState createState() => ChatRoomsState();
}

class ChatRoomsState extends State<ChatRoomsPage> {

  late ChatRoomsProvider chatRoomsProvider;

  @override
  void initState() {
    super.initState();
    chatRoomsProvider = context.read<ChatRoomsProvider>();
  }

  @override
  Widget build(BuildContext context) {
    ChatRoomsProvider chatRoomsProvider = context.watch<ChatRoomsProvider>();
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(
                  Intl.message("chatTitle"),
                  style: const TextStyle(
                    color: ColorConstants.appbarTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            centerTitle: false,
            automaticallyImplyLeading: false, // Add this line
          ),
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                chatRoomsProvider.chatRooms.isNotEmpty
                ? ListView.builder(
                  itemCount: chatRoomsProvider.chatRooms.length,
                  itemBuilder: (context, index) {
                    // Display each chat room in the list.
                    return _buildItem(context, chatRoomsProvider.chatRooms[index]);
                  },
                )
                : Center(
                  child: Text(
                    Intl.message("chatroomPlaceholder"),
                    style: const TextStyle(
                        fontSize: 23,
                        color: ColorConstants.themeColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: "MouldyCheeseRegular"
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, ChatRoom? chatRoom) {
    if (chatRoom != null) {
      return Column(
        children: [
          Ink(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                if (Utilities.isKeyboardShowing()) {
                  Utilities.closeKeyboard(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      arguments: ChatPageArguments(
                        characterId: chatRoom.characterId!,
                      ),
                    ),
                  ),
                );
              },
              onLongPress: () async {
                await _openChatRoomDialog(chatRoom);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    //Profile Picture
                    Material(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      clipBehavior: Clip.hardEdge,
                      child: chatRoom.photoBLOB.isNotEmpty
                          ? SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.memory(
                          chatRoom.photoBLOB,
                          fit: BoxFit.cover,
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle_rounded,
                              size: 60,
                              color: ColorConstants.greyColor,
                            );
                          },
                        ),
                      )
                          : const Icon(
                        Icons.account_circle,
                        size: 60,
                        color: ColorConstants.greyColor,
                      ),
                    ),
                    //Name and LastMessage
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            chatRoom.botName,
                            style: const TextStyle(
                              color: ColorConstants.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: chatRoom.lastMessage == null
                                    ? ChatParser.parseMessageContent(Intl.message("chatroomDefaultMessage"), null)
                                    : ChatParser.parseMessageContent(chatRoom.lastMessage!, null),
                                    style: const TextStyle(
                                      color: ColorConstants.greyColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                              // Add LastMessageTimeStamp
                              const SizedBox(width: 25),
                              Text(
                                chatRoom.lastMessageTimestamp==null
                                    ? ""
                                    : timestampIntoHourFormat(chatRoom.lastMessageTimestamp!),
                                style: const TextStyle(
                                  color: ColorConstants.greyColor,
                                  fontSize: 11,
                                ),
                              ),
                            ],
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
            thickness: 0.1,
            color: Colors.grey[100]!,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Future<void> _openChatRoomDialog(ChatRoom chatRoom) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return chatRoomDialog(context, chatRoom.botName);
        })) {
      case OnChatRoomDialogClicked.onDeleteClicked:
        await _openDeleteChatRoomDialog(context, chatRoom);
        break;
    }
  }

  Future<void> _openDeleteChatRoomDialog(BuildContext context, ChatRoom chatRoom) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return deleteChatRoomDialog(context);
        })) {
      case OnDeleteChatRoomDialogClicked.onCancelClicked:
        break;
      case OnDeleteChatRoomDialogClicked.onYesClicked:
        await chatRoomsProvider.deleteChatRoom(chatRoom.id!);
        break;
    }
  }

}
