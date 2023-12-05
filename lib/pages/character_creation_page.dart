import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../utils/utils.dart';


class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({Key? key, required this.arguments}) : super(key: key);

  final CharacterCreationPageArguments arguments;

  @override
  CharacterCreationState createState() => CharacterCreationState();
}

class CharacterCreationState extends State<CharacterCreationPage> {

  late CharactersProvider characterProvider;
  late ChatRoomsProvider chatRoomsProvider;

  TextEditingController _textFieldControllerName = TextEditingController();
  TextEditingController _textFieldControllerOpenAICharacterDescription = TextEditingController();
  TextEditingController _textFieldControllerOpenAIInstructionSystemPrompt = TextEditingController();
  TextEditingController _textFieldControllerPaLMContext = TextEditingController();
  TextEditingController _textFieldControllerPaLMExampleInput = TextEditingController();
  TextEditingController _textFieldControllerPaLMExampleOutput = TextEditingController();
  TextEditingController _textFieldControllerYourName = TextEditingController();
  TextEditingController _textFieldControllerFirstMessage = TextEditingController();
  TextEditingController _textFieldControllerImport = TextEditingController();
  double _openAITemperature = 1; // default value that I set
  double _paLMTemperature = 0.5; // default value that I set

  bool _isDoneButtonEnabled=false;

  Uint8List? _selectedProfileImageBLOB;
  Uint8List? _selectedBackgroundImageBLOB;

  final List models= [...OpenAIService.openAIModels, ...PaLMService.paLMModels];
  late String? _selectedModel;

  @override
  void initState() {
    characterProvider = context.read<CharactersProvider>();
    chatRoomsProvider = context.read<ChatRoomsProvider>();
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background placeholder image
        const SizedBox.expand(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(AppConstants.assetProfileBackgroundPlaceholder),
          ),
        ),
        // Background image
        Visibility(
          visible: _selectedBackgroundImageBLOB!.isNotEmpty,
          child: SizedBox.expand(
            child: SizedBox(
                width: 100,
                height: 100,
                child: Image.memory(
                  _selectedBackgroundImageBLOB!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, stackTrace) {
                    return const SizedBox.expand(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(AppConstants.assetProfileBackgroundPlaceholder),
                      ),
                    );
                  },
                )
            )
          ),
        ),
        // Apply a color filter on top of the background image
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make the Scaffold's background transparent
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove AppBar Shadow
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.white, // Update the color of the back button to match the text color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: widget.arguments.character.botName.isEmpty
                ? Text(
                Intl.message("newChatter"),
                style: const TextStyle(color: Colors.white),
                )
                : Text(
                Intl.message("editProfile"),
                style: const TextStyle(color: Colors.white),
                ),
            centerTitle: false,
            actions: [
              _buildDoneButton(),
            ],
          ),
          // Content
          body: SafeArea(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          //ProfilePicture
                          _buildProfilePicture(),
                          const SizedBox(height: 5),
                          //Name
                          _buildNameTextField(),
                          const SizedBox(height: 20),
                          //ModelSelection
                          _buildModelSelectionDropdown(),
                          const SizedBox(height: 20),
                          // Different UI by Service
                          if (OpenAIService.openAIModels.contains(_selectedModel)) ...[
                            // 1. Temperature
                            _buildOpenAITemperatureSlider(),
                            const SizedBox(height: 20),
                            // 2. Instruction System prompt
                            _buildPromptSizedTextField(
                                Intl.message("instructionSystemPrompt"),
                                Intl.message("instructionSystemPromptHint"),
                                _textFieldControllerOpenAIInstructionSystemPrompt,
                                OpenAIConstants.openAIDescriptionLimitation
                            ),
                            const SizedBox(height: 15),
                            // 3. Chatter Description prompt
                            _buildPromptSizedTextField(
                              Intl.message("chatterPrompt"),
                              Intl.message("chatterPromptHint"),
                              _textFieldControllerOpenAICharacterDescription,
                              OpenAIConstants.openAIDescriptionLimitation
                            ),
                            const SizedBox(height: 15),
                          ] else if (PaLMService.paLMModels.contains(_selectedModel)) ... [
                            _buildPaLMTemperatureSlider(),
                            const SizedBox(height: 20),
                            // Context prompt
                            _buildPromptSizedTextField(
                                Intl.message("paLMContextPromptLabel"),
                                Intl.message("paLMContextPromptHint"),
                                _textFieldControllerPaLMContext,
                                OpenAIConstants.openAIDescriptionLimitation
                            ),
                            const SizedBox(height: 15),
                            // Example prompt
                            _buildPaLMExampleInputField()
                          ],
                          _buildYourNameTextField(),
                          const SizedBox(height: 20),
                          _buildPromptSizedTextField(
                              Intl.message("firstMessageLabel"),
                              Intl.message("firstMessageHint"),
                              _textFieldControllerFirstMessage,
                              OpenAIConstants.openAIDescriptionLimitation
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    // Add your other widgets, such as text fields, buttons, etc., below this line
                  ],
                ),
              ),
            ),
          ),
          // Bottom navigation bar
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to left and right
                child: Divider(
                  color: Colors.white, // Choose the color you prefer
                  thickness: 0.3, // Adjust the thickness if needed
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildChangeBackgroundIcon(),
                  _buildImportIcon(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textFieldControllerName.dispose();
    _textFieldControllerOpenAICharacterDescription.dispose();
    _textFieldControllerOpenAIInstructionSystemPrompt.dispose();
    _textFieldControllerPaLMContext.dispose();
    _textFieldControllerPaLMExampleInput.dispose();
    _textFieldControllerPaLMExampleOutput.dispose();
    _textFieldControllerYourName.dispose();
    _textFieldControllerFirstMessage.dispose();
    _textFieldControllerImport.dispose();
    super.dispose();
  }

  void _init(){
    final serviceType = widget.arguments.character.service.type;
    switch (serviceType) {
      case ServiceType.openAI:
        final service = widget.arguments.character.service as OpenAIService;
        _textFieldControllerOpenAIInstructionSystemPrompt = TextEditingController(text: service.systemPrompt);
        _textFieldControllerOpenAICharacterDescription = TextEditingController(text: service.characterPrompt);
        setState(() {
          _selectedModel = service.modelName;
          _openAITemperature = service.temperature;
        });
        break;
      case ServiceType.paLM:
        final service = widget.arguments.character.service as PaLMService;
        _textFieldControllerPaLMContext = TextEditingController(text: service.context ?? "");
        setState(() {
          _selectedModel = service.modelName;
          _paLMTemperature = service.temperature;
          _textFieldControllerPaLMContext = TextEditingController(text: service.context);
          _textFieldControllerPaLMExampleInput =  TextEditingController(text: service.exampleInput);
          _textFieldControllerPaLMExampleOutput = TextEditingController(text: service.exampleOutput);
        });
        break;
      default:
        throw Exception('Unknown service type: $serviceType');
    }

    _textFieldControllerName = TextEditingController(text: widget.arguments.character.botName);
    _textFieldControllerImport = TextEditingController();
    _textFieldControllerYourName = TextEditingController();
    _textFieldControllerFirstMessage = TextEditingController(text: widget.arguments.character.firstMessage);

    widget.arguments.character.photoBLOB.isNotEmpty ?
    _selectedProfileImageBLOB = widget.arguments.character.photoBLOB :
    _selectedProfileImageBLOB = Uint8List(0);

    widget.arguments.character.backgroundPhotoBLOB.isNotEmpty ?
    _selectedBackgroundImageBLOB = widget.arguments.character.backgroundPhotoBLOB :
    _selectedBackgroundImageBLOB = Uint8List(0);

    _isDoneButtonEnabled = _textFieldControllerName.text.isNotEmpty;
    _textFieldControllerName.addListener(() {
      setState(() {
        _isDoneButtonEnabled = _textFieldControllerName.text.isNotEmpty;
      });
    });
  }

  Future<void> _pickProfileImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final mimeType = lookupMimeType(image.path);
      if (mimeType != null && !mimeType.startsWith('image/gif')) { //check if image is gif
        final File imageFile = File(image.path);
        final File compressedImageFile = await compressImage(imageFile);
        Uint8List BLOB = await convertImageToBLOB(compressedImageFile);
        setState(() {
          _selectedProfileImageBLOB = BLOB;
        });
      } else {
        Fluttertoast.showToast(msg: Intl.message("toastSelectStaticImage"));
      }
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<void> _pickBackgroundImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final mimeType = lookupMimeType(image.path);

      if (mimeType != null && !mimeType.startsWith('image/gif')) { //check if image is gif
        final File imageFile = File(image.path);
        final File compressedImageFile = await compressImage(imageFile);
        Uint8List BLOB = await convertImageToBLOB(compressedImageFile);
        setState(() {
          _selectedBackgroundImageBLOB = BLOB;
        });
      } else {
        Fluttertoast.showToast(msg: Intl.message("toastSelectStaticImage"));
      }
    } else {
      debugPrint('No image selected.');
    }
  }

  Widget _buildProfilePicture() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            //Implement onTab() Event
            _pickProfileImageFromGallery();
          },
          child: Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            clipBehavior: Clip.hardEdge,
            child: _selectedProfileImageBLOB!.isNotEmpty
                   ? SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.memory(
                          _selectedProfileImageBLOB!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle_rounded,
                              size: 100,
                              color: ColorConstants.greyColor,
                            );
                          },
                        )
                     )
                : const Icon(
              Icons.account_circle_rounded,
              size: 100,
              color: ColorConstants.greyColor,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {
              // Implement your functionality to pick an image from the gallery
              _pickProfileImageFromGallery();
            },
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.photo_library,
              color: ColorConstants.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameTextField(){
    return TextField(
      controller: _textFieldControllerName,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: Intl.message("name"), // Label for the TextField
        labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal
        ),
        suffixIcon: const Icon(
          Icons.edit, // Pencil icon
          color: Colors.white,
          size: 18, // Adjust the size of the icon
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildYourNameTextField(){
    return TextField(
      controller: _textFieldControllerYourName,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: Intl.message("chatterRecognizeUserName"),
        labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal
        ),
        suffixIcon: const Icon(
          Icons.edit, // Pencil icon
          color: Colors.white,
          size: 18, // Adjust the size of the icon
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildModelSelectionDropdown() {
    DropdownMenuItem<String> buildDropdownOption(String optionName) {
      String imagePath = "";
      if (OpenAIService.openAIModels.contains(optionName)) {
        imagePath = AppConstants.assetChatGPT;
      } else if (PaLMService.paLMModels.contains(optionName)){
        imagePath = AppConstants.assetPaLM;
      }
      return DropdownMenuItem<String>(
        value: optionName,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(optionName),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(right: 8, left: 5),// Wrap the DropdownButton with a Container
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(5.0), // Optional: add a border radius
      ),
      child: DropdownButton<String>(
        value: _selectedModel,
        hint: Text(Intl.message("selectModel")),
        onChanged: (String? newModel) {
          setState(() {
            _selectedModel = newModel!;
          });
        },
        items: models.map<DropdownMenuItem<String>>((value) { // Add type annotation here
          return buildDropdownOption(value as String); // Cast the value to String
        }).toList(),
        underline: const SizedBox.shrink(), // Optional: remove the underline
      ),
    );
  }

  Widget _buildOpenAITemperatureSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Intl.message("temperatureLabel"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
        const SizedBox(height: 5),
        Slider.adaptive(
          value: _openAITemperature,
          min: 0,
          max: 2,
          divisions: 200, // Number of discrete divisions
          label: _openAITemperature.toStringAsFixed(2), // Label to show value
          activeColor: Colors.white,
          inactiveColor: Colors.white60,
          onChanged: (value) {
            setState(() {
              _openAITemperature = value;
            });
          },
        ),
        Text(
            _openAITemperature.toStringAsFixed(2),
            style: const TextStyle(
                color: Colors.white
            )
        ),
      ],
    );
  }

  Widget _buildPaLMTemperatureSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            Intl.message("temperatureLabel"),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
        const SizedBox(height: 5),
        Slider.adaptive(
          value: _paLMTemperature,
          min: 0,
          max: 1,
          divisions: 200, // Number of discrete divisions
          label: _paLMTemperature.toStringAsFixed(2), // Label to show value
          activeColor: Colors.white,
          inactiveColor: Colors.white60,
          onChanged: (value) {
            setState(() {
              _paLMTemperature = value;
            });
          },
        ),
        Text(
            _paLMTemperature.toStringAsFixed(2),
            style: const TextStyle(
                color: Colors.white
            )
        ),
      ],
    );
  }

  Widget _buildPromptSizedTextField(
      String labelText,
      String hintText,
      TextEditingController controller,
      int textLimitation
      ){
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (BuildContext context, TextEditingValue value, Widget? child) {
        bool isLimitReached = value.text.length >= textLimitation;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              scrollPhysics: const BouncingScrollPhysics(),
              cursorColor: Colors.white,
              maxLines: null, // unlimited lines
              maxLength: textLimitation,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w300,
                ),
                hintMaxLines: 10,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: isLimitReached ? Colors.red : Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: isLimitReached ? Colors.red : Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: isLimitReached ? Colors.red : Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: labelText,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                counterStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPaLMExampleInputField(){
    return Card(
      elevation: 4.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.white, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  Intl.message("paLMExamplePromptLabel"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  Intl.message("paLMExamplePromptHint"),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 10),
            child: _buildPromptSizedTextField(
                Intl.message("paLMExampleInputLabel"),
                Intl.message("paLMExampleInputHint"),
                _textFieldControllerPaLMExampleInput,
                OpenAIConstants.openAIDescriptionLimitation
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 40),
            child: _buildPromptSizedTextField(
                Intl.message("paLMExampleOutputLabel"),
                Intl.message("paLMExampleOutputHint"),
                _textFieldControllerPaLMExampleOutput,
                OpenAIConstants.openAIDescriptionLimitation
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }



  Widget _buildChangeBackgroundIcon() {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 80,
        width: 80,
        child: InkWell(
          onTap: () async {
            // Implement your functionality to change the background
            _pickBackgroundImageFromGallery();
          },
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Icon(
                Icons.image, // Use any icon you want
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 5),
              Text(
                Intl.message("background"),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImportIcon(){
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 80,
        width: 80,
        child: InkWell(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return _importDialog(context);
              }
            );
          },
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Icon(
                Icons.file_download_outlined, // Use any icon you want
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 5),
              Text(
                Intl.message("import"),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneButton() {
    Color textColor = _isDoneButtonEnabled ? Colors.white : Colors.white38;
    return TextButton(
      onPressed: _isDoneButtonEnabled
        ? () async {
          if (Utilities.isKeyboardShowing()) {
            Utilities.closeKeyboard(context);
          }
          _selectedBackgroundImageBLOB!.isEmpty ? _selectedBackgroundImageBLOB = await convertAssetImageToBLOB(AppConstants.assetBackgroundCozyRoom) : Uint8List(0);

          final newCharacter = Character(
            id: widget.arguments.character.id,
            photoBLOB: _selectedProfileImageBLOB!,
            backgroundPhotoBLOB: _selectedBackgroundImageBLOB!,
            botName: _textFieldControllerName.text,
            userName: _textFieldControllerYourName.text,
            firstMessage: _textFieldControllerFirstMessage.text,
            service: _getService()
          );
          await characterProvider.insertOrUpdateCharacter(newCharacter);

          if(newCharacter.firstMessage.isNotEmpty){
            // This only insert first Message if chatroom doesn't exist
            final firstChatRoom = ChatRoom.firstChatRoom(newCharacter);
            final firstMessage = ChatMessage.firstMessage(firstChatRoom.id!, newCharacter.id!, _textFieldControllerFirstMessage.text);
            await characterProvider.insertFirstMessage(newCharacter, firstMessage);
          }

          if(widget.arguments.character.id != null){
            await characterProvider.updateCurrentCharacter(widget.arguments.character.id!);
          }
          await chatRoomsProvider.updateChatRooms();

          if (context.mounted) {
            Navigator.of(context).pop();
          }
      }
          : null,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(
        Intl.message("done"),
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _importDialog(BuildContext context){
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: ColorConstants.themeColor,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Intl.message("import"),
              style: const TextStyle(
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _textFieldControllerImport,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),  // change border color here
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),  // and here
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),  // and here
                      ),
                      labelText: Intl.message("pasteCode"),
                      labelStyle: const TextStyle(
                        color: Colors.white38,
                        fontSize: 15
                      )
                    ),
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.content_paste,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
                    if (clipboardData != null) {
                      _textFieldControllerImport.text = clipboardData.text!;
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  IService _getService(){
    if (OpenAIService.openAIModels.contains(_selectedModel)){
      return OpenAIService(
          characterId: widget.arguments.character.id!,
          modelName: _selectedModel!,
          temperature: _openAITemperature,
          systemPrompt: _textFieldControllerOpenAIInstructionSystemPrompt.text,
          characterPrompt: _textFieldControllerOpenAICharacterDescription.text
      );
    } else if (PaLMService.paLMModels.contains(_selectedModel)){
      final example = PaLMExample(
          input: PaLMMessage(
            author: PaLMMessageRole.assistant,
            content: ""
          ),
          output: PaLMMessage(
            author: PaLMMessageRole.user,
            content: ""
          )
      );
      return PaLMService(
         characterId: widget.arguments.character.id!,
         modelName: _selectedModel!,
         context: _textFieldControllerPaLMContext.text,
         exampleInput: _textFieldControllerPaLMExampleInput.text,
         exampleOutput: _textFieldControllerPaLMExampleOutput.text,
         temperature: _paLMTemperature,
         candidateCount: 1
     );
    } else {
      throw Exception("Service not found $_selectedModel");
    }
  }

}

class CharacterCreationPageArguments {
  final Character character;

  CharacterCreationPageArguments({required this.character});
}
