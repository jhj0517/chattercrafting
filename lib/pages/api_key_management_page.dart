import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../providers/providers.dart';
import '../pages/pages.dart';
import '../constants/constants.dart';
import '../models/services/i_service.dart';

class APIKeyManagementPage extends StatefulWidget {
  const APIKeyManagementPage({Key? key}) : super(key: key);

  @override
  State createState() => APIKeyManagementPageState();
}

class APIKeyManagementPageState extends State<APIKeyManagementPage> {

  late KeyProvider keyProvider;
  late TextEditingController _textFieldControllerKey;

  @override
  void initState() {
    super.initState();
    keyProvider = context.read<KeyProvider>();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            Intl.message("manageAPIKey")
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          children: [
            _buildSelectableRow(Intl.message("openAI"), AppConstants.assetChatGPT, () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                return _apiKeyDialog(context, Intl.message("openAIAPIKey"), ServiceType.openAI);
              }
              );
            }),
            _buildSelectableRow(Intl.message("googlePaLM"), AppConstants.assetPaLM, () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _apiKeyDialog(context, Intl.message("paLMAPIKey"), ServiceType.paLM);
                  }
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldControllerKey.dispose();
    super.dispose();
  }

  void _init(){
    _textFieldControllerKey = TextEditingController();
  }

  Widget _buildSelectableRow(String text, String imagePath, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: ColorConstants.vertLightGreyDividerColor, // Very light grey color
        ),
      ],
    );
  }

  Widget _apiKeyDialog(BuildContext context, String title, ServiceType serviceType){
    String storeKey;
    if (serviceType== ServiceType.openAI){
      storeKey = SecureStorageConstants.keyOpenAI;
      _textFieldControllerKey.text = keyProvider.openAPIKey == null ? "" : keyProvider.openAPIKey!;
    } else if (serviceType == ServiceType.paLM){
      storeKey = SecureStorageConstants.keyPaLM;
      _textFieldControllerKey.text = keyProvider.paLMAPIKey == null ? "" : keyProvider.paLMAPIKey!;
    } else {
      throw(Exception("unfounded service"));
    }

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
              title,
              style: const TextStyle(
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              Intl.message("neverLeakAPIKey"),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white60,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _textFieldControllerKey,
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
                        labelText: Intl.message("pasteAPIKey"),
                        labelStyle: const TextStyle(
                            color: Colors.white38,
                            fontSize: 15
                        )
                    ),
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                  ),
                ),
                Material(
                  color: ColorConstants.themeColor, // Match the background color
                  child: IconButton(
                    icon: const Icon(
                      Icons.content_paste,
                      color: Colors.white,
                    ),
                    splashColor: Colors.white.withOpacity(0.3), // Set the splash color here
                    onPressed: () async {
                      ClipboardData? clipboardData = await Clipboard.getData('text/plain');
                      Fluttertoast.showToast(msg: Intl.message("textIsPasted"));
                      if (clipboardData != null) {
                        _textFieldControllerKey.text = clipboardData.text!;
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return Colors.grey.withOpacity(0.2); // Change color and opacity as needed
                      return Colors.transparent; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () async {
                  keyProvider.saveKey(storeKey, _textFieldControllerKey.text);
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: title+Intl.message("isSaved"));
                },
                child: Text(
                  Intl.message("registerAPI"),
                  style: const TextStyle(
                    color: ColorConstants.thickThemeColor,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}
