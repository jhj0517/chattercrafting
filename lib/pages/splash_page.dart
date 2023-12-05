import 'package:chattercrafting/providers/providers.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tiktoken/tiktoken.dart' as tiktokenizer;

import 'pages.dart';
import '../localdb/localdb.dart';
import '../localdb/sqflite_helper.dart';
import '../constants/color_constants.dart';
import '../constants/openai_constants.dart';
import '../constants/app_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  late SQFliteHelper sqFliteHelper;
  late KeyProvider keyProvider;

  @override
  void initState() {
    sqFliteHelper = context.read<SQFliteHelper>();
    keyProvider = context.read<KeyProvider>();

    Future.delayed(const Duration(seconds: 1), () async {
      // just delay for showing this slash page
      await _initData();
      if(context.mounted){
        await sqFliteHelper.insertDefaultCharacters("");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainNavigation()),
        );
      }
    });
    super.initState();
  }

  Future<void> _initData() async{
    await dotenv.load(fileName: ".env");
    await keyProvider.initKeys();
    _initTokenizer();
  }

  void _initTokenizer(){
    final encoding = tiktokenizer.encodingForModel(OpenAIConstants.gpt3halfTurboId);
    encoding.encode("Initialize tokenizer, 토크나이저 초기화, トークナイザーの初期化").length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppConstants.assetAppIcon,
              width: 130, //screenWidth/4
              height: 130,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
