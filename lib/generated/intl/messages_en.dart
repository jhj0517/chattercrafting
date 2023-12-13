// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(characterName) =>
      "No messages yet.\nStart new chat with ${characterName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "appTitle": MessageLookupByLibrary.simpleMessage("ChatterCrafting"),
        "appTitleEN": MessageLookupByLibrary.simpleMessage("ChatterCrafting"),
        "background": MessageLookupByLibrary.simpleMessage("Background"),
        "backingUp": MessageLookupByLibrary.simpleMessage("Backing up chat.."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chatBackup": MessageLookupByLibrary.simpleMessage("Chat Backup"),
        "chatBackupConfirm": MessageLookupByLibrary.simpleMessage(
            "Want to backup your chats? If you already have data backed up on your server, this will overwrite it."),
        "chatGPTDefaultCharacterName":
            MessageLookupByLibrary.simpleMessage("ChatGPT"),
        "chatGPTServer": MessageLookupByLibrary.simpleMessage(
            "ChatGPT Server is overloaded now."),
        "chatInputHint":
            MessageLookupByLibrary.simpleMessage("Type your message..."),
        "chatOption": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatPlaceHolderMessage": m0,
        "chatRestore": MessageLookupByLibrary.simpleMessage("Chat Restore"),
        "chatRestoreConfirm": MessageLookupByLibrary.simpleMessage(
            "Want to recover chats you\'ve backed up to the server? It\'ll overwrite your existing local data, and the app will restart after the recovery."),
        "chatRoomSetting":
            MessageLookupByLibrary.simpleMessage("ChatRoom Settings"),
        "chatRooms": MessageLookupByLibrary.simpleMessage("Chatrooms"),
        "chatTitle": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatroomBackgroundColor":
            MessageLookupByLibrary.simpleMessage("ChatRoom Background Color"),
        "chatroomDefaultMessage": MessageLookupByLibrary.simpleMessage(
            "No one has chatted yet in this room."),
        "chatroomPlaceholder":
            MessageLookupByLibrary.simpleMessage("No ChatRooms yet :)"),
        "chatterChatBoxBackgroundColor": MessageLookupByLibrary.simpleMessage(
            "Chatter\'s ChatBox Background Color"),
        "chatterCode": MessageLookupByLibrary.simpleMessage("Chatter code"),
        "chatterCodeExplain": MessageLookupByLibrary.simpleMessage(
            "You can share this chatter code with others. (This chatter code is only valid for one week.)"),
        "chatterCodeInvalid": MessageLookupByLibrary.simpleMessage(
            "This is invalid Chatter code"),
        "chatterCraftingBackupPolicy1": MessageLookupByLibrary.simpleMessage(
            "· ChatterCrafting does not automatically back up your chats to the server, so if you want to restore your chat data on another device, you can manually back up your chats and then restore them."),
        "chatterCraftingBackupPolicy2": MessageLookupByLibrary.simpleMessage(
            "· Please note that backing up and restoring chats are limited to 5 operations per day."),
        "chatterFontColor":
            MessageLookupByLibrary.simpleMessage("Chatter\'s Font Color"),
        "chatterFontSize":
            MessageLookupByLibrary.simpleMessage("Chatter\'s Font Size"),
        "chatterPrompt":
            MessageLookupByLibrary.simpleMessage("Chatter Description Prompt"),
        "chatterPromptHint": MessageLookupByLibrary.simpleMessage(
            "This prompt is about your chatter. Describe about your Chatter\'s personality, background, or anything else you\'d like to!"),
        "chatterRecognizeUserName": MessageLookupByLibrary.simpleMessage(
            "The name by which you will be recognized"),
        "chatterTitle": MessageLookupByLibrary.simpleMessage("Chatter"),
        "chatters": MessageLookupByLibrary.simpleMessage("Chatters"),
        "colors": MessageLookupByLibrary.simpleMessage("Colors"),
        "contextPrompt": MessageLookupByLibrary.simpleMessage("Context Prompt"),
        "contextPromptHint":
            MessageLookupByLibrary.simpleMessage("Context Prompt hint here"),
        "copyChatOption": MessageLookupByLibrary.simpleMessage("Copy"),
        "defaultCharacterBoyDescription": MessageLookupByLibrary.simpleMessage(
            "<chatter> has a soft heart and is an excellent listener. A friend of <user>, <chatter> is always there for their friends in times of need, ready to lend a sympathetic ear to their troubles."),
        "defaultCharacterBoyName":
            MessageLookupByLibrary.simpleMessage("Character B"),
        "defaultCharacterGirlDescription": MessageLookupByLibrary.simpleMessage(
            "<chatter> is a lively and natural extrovert, always full of energy. A friend of <user>, <chatter> thoroughly enjoys spending time and engaging in conversations with friends. Genuine interest in listening to other people\'s stories is a hallmark of <chatter>\'s personality."),
        "defaultCharacterGirlFirstMessage":
            MessageLookupByLibrary.simpleMessage(
                "Hey there! How have you been?"),
        "defaultCharacterGirlName":
            MessageLookupByLibrary.simpleMessage("Character A"),
        "defaultCharacterSystemPrompt": MessageLookupByLibrary.simpleMessage(
            "Draft a conversation between <chatter> and <user>."),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
        "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
            "Do you wish to delete your account data from ChatterCrafting? All chat data will be removed, and the app will then restart."),
        "deleteAccountPolicy1": MessageLookupByLibrary.simpleMessage(
            "· This will delete your account data from ChatterCrafting."),
        "deleteAccountPolicy2": MessageLookupByLibrary.simpleMessage(
            "· All chat data will be removed after your account is deleted, and the app will then restart."),
        "deleteChatOption": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteChatroom": MessageLookupByLibrary.simpleMessage("Delete Chat"),
        "deleteChatroomConfirm": MessageLookupByLibrary.simpleMessage(
            "Confirm Chat deletion?\nAll chat history will be lost!"),
        "deleteChatter": MessageLookupByLibrary.simpleMessage("Delete Chatter"),
        "deleteChatterConfirm": MessageLookupByLibrary.simpleMessage(
            "Confirm chatter deletion?\nAll chat history will be lost!"),
        "deleteOption": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleting": MessageLookupByLibrary.simpleMessage(
            "Deleting your account data..."),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "descriptionHint": MessageLookupByLibrary.simpleMessage(
            "Describe about your Chatter\'s personality, background, or anything else you\'d like to!"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "doneExc": MessageLookupByLibrary.simpleMessage("Done!"),
        "doneRestart":
            MessageLookupByLibrary.simpleMessage("Done!\nRestarting app.."),
        "eULA": MessageLookupByLibrary.simpleMessage("EULA"),
        "editChatOption": MessageLookupByLibrary.simpleMessage("Edit"),
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "enableMarkdownRendering":
            MessageLookupByLibrary.simpleMessage("Enable Markdown Rendering"),
        "exitApp": MessageLookupByLibrary.simpleMessage("Exit app"),
        "exitAppConfirm":
            MessageLookupByLibrary.simpleMessage("Are you sure to exit app?"),
        "export": MessageLookupByLibrary.simpleMessage("Export"),
        "exportConfirm": MessageLookupByLibrary.simpleMessage(
            "Want to export your chatter? This will create shareable chatter code."),
        "exporting": MessageLookupByLibrary.simpleMessage("Exporting.."),
        "firstMessageHint": MessageLookupByLibrary.simpleMessage(
            "Customize Chatter\'s first message if you wish, or leave it empty if you prefer not to."),
        "firstMessageLabel":
            MessageLookupByLibrary.simpleMessage("Chatter\'s First Message"),
        "fontSize": MessageLookupByLibrary.simpleMessage("Font Size"),
        "googlePaLM": MessageLookupByLibrary.simpleMessage("Google (PaLM)"),
        "import": MessageLookupByLibrary.simpleMessage("Import"),
        "importing": MessageLookupByLibrary.simpleMessage("Importing.."),
        "instructionSystemPrompt":
            MessageLookupByLibrary.simpleMessage("Instruction System Prompt"),
        "instructionSystemPromptHint": MessageLookupByLibrary.simpleMessage(
            "Provide a prompt to instruct ChatGPT on what you want it to do. For example, if you say \"Do Role-playing\" here, ChatGPT will do its best to role-play"),
        "insufficientTokenGem": MessageLookupByLibrary.simpleMessage(
            "You don\'t have enough TokenGems! Please purchase more TokenGems to continue chatting."),
        "isSaved": MessageLookupByLibrary.simpleMessage("is saved."),
        "later": MessageLookupByLibrary.simpleMessage("Later"),
        "manageAPIKey":
            MessageLookupByLibrary.simpleMessage("API Key Management"),
        "moreTitle": MessageLookupByLibrary.simpleMessage("More"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "neverLeakAPIKey": MessageLookupByLibrary.simpleMessage(
            "Never leak the API key to anywhere else!"),
        "newChatter": MessageLookupByLibrary.simpleMessage("New Chatter"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noChatterFound":
            MessageLookupByLibrary.simpleMessage("No chatter has found!"),
        "noDataFound":
            MessageLookupByLibrary.simpleMessage("No chat was backed up!"),
        "openAI": MessageLookupByLibrary.simpleMessage("OpenAI (ChatGPT)"),
        "openAIAPIKey": MessageLookupByLibrary.simpleMessage("OpenAI API Key"),
        "openAIAPIKeyErrorTitle":
            MessageLookupByLibrary.simpleMessage("Invalid OpenAI API Key"),
        "openAIAPIisInvalid": MessageLookupByLibrary.simpleMessage(
            "Your OpenAI API Key is invalid. Would you like to go to the page where you can register it?"),
        "openAIAPIisNotRegistered": MessageLookupByLibrary.simpleMessage(
            "Your OpenAI API Key is not registered yet. Would you like to go to the page where you can register it?"),
        "operationFailed":
            MessageLookupByLibrary.simpleMessage("Operation Failed!"),
        "os": MessageLookupByLibrary.simpleMessage("OS"),
        "paLMAPIKey": MessageLookupByLibrary.simpleMessage("PaLM API Key"),
        "paLMAPIKeyErrorTitle":
            MessageLookupByLibrary.simpleMessage("Invalid PaLM API Key"),
        "paLMAPIisInvalid": MessageLookupByLibrary.simpleMessage(
            "Your PaLM API Key is invalid. Would you like to go to the page where you can register it?"),
        "paLMContextPromptHint": MessageLookupByLibrary.simpleMessage(
            "Provide a prompt to guide PaLM on what you want it to do. For example, if you say \"Do Role-playing\" here, PaLM will do its best to role-play"),
        "paLMContextPromptLabel":
            MessageLookupByLibrary.simpleMessage("Context Prompt"),
        "paLMExampleInputHint": MessageLookupByLibrary.simpleMessage(
            "Enter an example input for the conversation"),
        "paLMExampleInputLabel":
            MessageLookupByLibrary.simpleMessage("Example Input"),
        "paLMExampleOutputHint": MessageLookupByLibrary.simpleMessage(
            "Enter an example of what PaLM should generate as output"),
        "paLMExampleOutputLabel":
            MessageLookupByLibrary.simpleMessage("Example Output"),
        "paLMExamplePromptHint": MessageLookupByLibrary.simpleMessage(
            "This prompt gives PaLM an example of what it should generate in conversation. Both input and output example prompts must be provided simultaneously. If not, leave both fields empty"),
        "paLMExamplePromptLabel":
            MessageLookupByLibrary.simpleMessage("Example Conversation Prompt"),
        "pasteAPIKey":
            MessageLookupByLibrary.simpleMessage("Paste the API key here"),
        "pasteCode":
            MessageLookupByLibrary.simpleMessage("Paste chatter code here"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "reachedBackupLimit": MessageLookupByLibrary.simpleMessage(
            "You have reached your daily limit! Backup and restoration of chats are permitted up to 5 times a day. We apologize for any inconvenience caused."),
        "registerAPI": MessageLookupByLibrary.simpleMessage("Register"),
        "resetToDefaults":
            MessageLookupByLibrary.simpleMessage("Reset to Defaults"),
        "restoringChat":
            MessageLookupByLibrary.simpleMessage("Restoring chat.."),
        "searchChatter":
            MessageLookupByLibrary.simpleMessage("Search chatter name"),
        "selectModel": MessageLookupByLibrary.simpleMessage("Select Model"),
        "signInCanceled":
            MessageLookupByLibrary.simpleMessage("Sign in canceled"),
        "signInFail": MessageLookupByLibrary.simpleMessage("Sign in fail"),
        "signInSuccess":
            MessageLookupByLibrary.simpleMessage("Sign in success"),
        "signInWithApple":
            MessageLookupByLibrary.simpleMessage("Sign in with Apple"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "spendingHistory":
            MessageLookupByLibrary.simpleMessage("Spending History"),
        "temperatureLabel":
            MessageLookupByLibrary.simpleMessage("Temperature (Randomness)"),
        "textIsPasted":
            MessageLookupByLibrary.simpleMessage("Text has been pasted."),
        "toastSelectStaticImage": MessageLookupByLibrary.simpleMessage(
            "Please choose a static image, not formats like GIF!"),
        "tokenReachedLimitation": MessageLookupByLibrary.simpleMessage(
            "The purchase of TokenGem is temporarily disabled. We\'re sorry for the inconvenience, we\'ll do our best to restore the service."),
        "totalUsedTokenGem":
            MessageLookupByLibrary.simpleMessage("Total used TokenGem"),
        "updateAvailable":
            MessageLookupByLibrary.simpleMessage("Update Available"),
        "updateAvailableExplain": MessageLookupByLibrary.simpleMessage(
            "A new version of the app is available. Please update your app."),
        "updateNow": MessageLookupByLibrary.simpleMessage("Update Now"),
        "usagePolicy": MessageLookupByLibrary.simpleMessage("Usage Policies"),
        "usagePolicy1": MessageLookupByLibrary.simpleMessage(
            "Our application (\"App\") provides a platform for users to communicate with virtual characters through text-based conversations. This Usage Policy governs your use of our App."),
        "usagePolicy10": MessageLookupByLibrary.simpleMessage(
            "5. Changes to the Usage Policy"),
        "usagePolicy11": MessageLookupByLibrary.simpleMessage(
            "We may revise this Usage Policy at any time by amending this page. You are expected to check this page regularly to take notice of any changes we made, as they are legally binding on you."),
        "usagePolicy12": MessageLookupByLibrary.simpleMessage(
            "6. Third-Party Services and APIs"),
        "usagePolicy13": MessageLookupByLibrary.simpleMessage(
            "In delivering the services of our App, we utilize the API of ChatGPT. Consequently, we adhere to the usage policies of ChatGPT. You can review the ChatGPT\'s Usage Policy "),
        "usagePolicy14": MessageLookupByLibrary.simpleMessage("here,"),
        "usagePolicy15": MessageLookupByLibrary.simpleMessage(
            " By using our App, you also agree to abide by the usage policies of ChatGPT.\nYour use of third-party services and APIs, including ChatGPT, PaLM API is subject to the terms and conditions, privacy policies, and other policies and agreements applicable to such third-party services. We encourage you to read those documents carefully."),
        "usagePolicy2": MessageLookupByLibrary.simpleMessage(
            "1. Acceptance of Usage Policy"),
        "usagePolicy3": MessageLookupByLibrary.simpleMessage(
            "By using our App, you confirm that you accept this Usage Policy and agree to comply with it. If you do not agree to this policy, you must not use our App. We recommend that you print a copy of this Usage Policy for future reference."),
        "usagePolicy4":
            MessageLookupByLibrary.simpleMessage("2. Prohibited Uses"),
        "usagePolicy5": MessageLookupByLibrary.simpleMessage(
            "You may use our App only for lawful purposes. You may not use our App:\n- In any way that breaches any applicable local, national or international law or regulation.\n- To send, knowingly receive, upload, download, use or re-use any material that does not comply with our content standards.\n- To transmit, or procure the sending of, any unsolicited or unauthorized advertising or promotional material or any other form of similar solicitation (spam)."),
        "usagePolicy6":
            MessageLookupByLibrary.simpleMessage("3. Content Standards"),
        "usagePolicy7": MessageLookupByLibrary.simpleMessage(
            "These content standards apply to any and all user-generated content on our App. User-generated content must not:\n- Contain any material that is defamatory, obscene, offensive, hateful or inflammatory.\n- Promote sexually explicit material, violence or discrimination based on race, sex, religion, nationality, disability, sexual orientation or age.\n- Infringe any copyright, database right or trademark of any other person.\n- Be likely to deceive any person or be used to impersonate any person, or to misrepresent your identity or affiliation with any person."),
        "usagePolicy8": MessageLookupByLibrary.simpleMessage(
            "4. Breach of This Usage Policy"),
        "usagePolicy9": MessageLookupByLibrary.simpleMessage(
            "Failure to comply with this Usage Policy constitutes a material breach of the terms of use upon which you are permitted to use our App, and may result in our taking all or any of the following actions:\n- Immediate, temporary or permanent withdrawal of your right to use our App.\n- Legal proceedings against you for reimbursement of all costs on an indemnity basis resulting from the breach.\n- Further legal action against you.\nWe exclude liability for actions taken in response to breaches of this Usage Policy."),
        "usagePolicySubTitle": MessageLookupByLibrary.simpleMessage(
            "ChatterCrafting Usage Policies"),
        "usagePolicyTitle":
            MessageLookupByLibrary.simpleMessage("Usage Policies"),
        "userChatBoxBackgroundColor": MessageLookupByLibrary.simpleMessage(
            "User\'s ChatBox Background Color"),
        "userFontColor":
            MessageLookupByLibrary.simpleMessage("User\'s Font Color"),
        "userFontSize":
            MessageLookupByLibrary.simpleMessage("User\'s Font Size"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
