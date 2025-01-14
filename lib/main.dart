import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'constants/constants.dart';
import 'pages/pages.dart';
import 'providers/providers.dart';
import 'localdb/localdb.dart';
import 'repositories/repositories.dart';

Future<SharedPreferences> _initSharedPreference() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await SharedPreferences.getInstance();
}

void main() async {
  final SharedPreferences prefs = await _initSharedPreference();

  runApp(
    Phoenix(
        child: MyApp(
          prefs: prefs,
        )
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SQFliteHelper>(
          create: (context) => SQFliteHelper(),
        ),
        ChangeNotifierProvider<KeyProvider>(
          create: (context) => KeyProvider(
            keyRepository: KeyRepository(
                secureStorage: const FlutterSecureStorage()
            ),
          ),
        ),
        ChangeNotifierProvider<OpenAIProvider>(
          create: (context) => OpenAIProvider(
            openAIRepository: OpenAIRepository(
            )
          ),
        ),
        ChangeNotifierProvider<CharactersProvider>(
          create: (context) => CharactersProvider(
              charactersRepository: CharactersRepository(
                  sqfliteHelper: context.read<SQFliteHelper>()
              )
          ),
        ),
        ChangeNotifierProvider<ChatRoomsProvider>(
          create: (context) => ChatRoomsProvider(
            chatRoomsRepository: ChatRoomRepository(
              prefs: prefs,
              sqfliteHelper: context.read<SQFliteHelper>()
            ),
          ),
        ),
        ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(
            chatRepository: ChatRepository(
              sqfliteHelper: context.read<SQFliteHelper>(),
              prefs: prefs,
            ),
            charactersProvider: context.read<CharactersProvider>(),
            chatRoomsProvider: context.read<ChatRoomsProvider>(),
            openAIProvider: context.read<OpenAIProvider>(),
            keyProvider: context.read<KeyProvider>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: Intl.message("appTitle"),
        localizationsDelegates: const [
          S.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primaryColor: ColorConstants.themeColor,
          primarySwatch: MaterialColor(0xff203152, ColorConstants.swatchColor),
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: ColorConstants.textSelectionHandlerColor, // Change the color of the selection handle
            selectionColor: ColorConstants.textSelectionColor,
          ),
        ),
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
