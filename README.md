# chattercrafting
chattercrafting is a mobile AI chat project using external APIs. This is built with Flutter.

![record](https://github.com/jhj0517/chattercrafting/assets/97279763/b80644e7-fa55-4a4f-a2d2-234e2251c01a)

You can use APIs including:
- ChatGPT
- PaLM

You can also find another version of this project directly on the
[Playstore](https://play.google.com/store/apps/details?id=com.wecraftstudio.chattercrafting) , [Appsotre](https://apps.apple.com/app/id6450148926) too, if you want!

[![play-store-logo-github](https://github.com/jhj0517/chattercrafting/assets/97279763/282e3591-19b2-436c-a00e-0cf446ad222e)](https://play.google.com/store/apps/details?id=com.wecraftstudio.chattercrafting)
[![appstore-logo-github](https://github.com/jhj0517/chattercrafting/assets/97279763/733813ff-733c-4146-b705-7fdd1e2560c7)](https://apps.apple.com/app/id6450148926)

# Feature
- AI Chat with your own customized characters using your ChatGPT API.
- AI Chat with your own customized characters using your PaLM API.

# Architecture
![diagram](https://github.com/jhj0517/chattercrafting/assets/97279763/4759246c-093d-459e-81aa-d9e1a9d9a396)

# Techs
This table details the primary patterns and packages used in this project.
| Tech | Usage |
| ---------- | ----- |
| Provider pattern | Monitor data changes using ChangeNotifier |
| Firebase | Used for Authentication, Firestore (Database), Firebase Messaging (In-app Messaging), and Remote Config |
| sqflite | Used to store chat data as local data |
| dio | 	Used for requesting API responses over the network. However, a different built-in package, dart_openai, is specifically used for ChatGPT. Dio is primarily used for PaLM. |
| dart_openai | 	A built-in package for requesting ChatGPT API responses in Flutter |
| flutter_image_compress | Efficiently reduces image size, which is cost-effective for storing images on the server. Demonstrates efficiency with reductions from 2MB to 95kB, without compromising image quality. |
| tiktoken | 	A built-in package for counting tokens in ChatGPT |
| flutter_markdown | 	Enables markdown rendering in chat |
| intl | Used for localization. This project is localized in English, Korean, and Japanese. |
| flutter_secure_storage | 	Stores API keys securely within the app. This package implements a security algorithm to safeguard API keys. |

# Flutter environment
This project is built fine with the following environment:
```
[√] Flutter (Channel stable, 3.13.2, on Microsoft Windows [Version 10.0.19045.3693], locale ko-KR)
    • Flutter version 3.13.2 on channel stable at C:\FlutterSDK\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision ff5b5b5fa6 (4 months ago), 2023-08-24 08:12:28 -0500
    • Engine revision b20183e040
    • Dart version 3.1.0
    • DevTools version 2.25.0
```

# License
This project is licensed under the Apache License 2.0.
