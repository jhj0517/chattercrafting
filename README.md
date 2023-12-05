# chattercrafting
chattercrafting is a mobile AI chat project. This is built with Flutter.

![record](https://github.com/jhj0517/chattercrafting/assets/97279763/b80644e7-fa55-4a4f-a2d2-234e2251c01a)

You can use APIs including:
- ChatGPT
- PaLM

# Feature
- AI Chat with your own customized characters using system prompts etc in ChatGPT.
- AI Chat with your own customized characters using instruction prompts, example prompts in PaLM.
- Encode your characters with special strings for easy sharing with others.

# Architecture
![diagram](https://github.com/jhj0517/chattercrafting/assets/97279763/9a3598ca-ef93-4a23-bec8-21ae846e6fbc)

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

# License
This project is licensed under the Apache License 2.0.
