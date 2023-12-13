// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ChatterCrafting`
  String get appTitle {
    return Intl.message(
      'ChatterCrafting',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `ChatterCrafting`
  String get appTitleEN {
    return Intl.message(
      'ChatterCrafting',
      name: 'appTitleEN',
      desc: '',
      args: [],
    );
  }

  /// `Chatter`
  String get chatterTitle {
    return Intl.message(
      'Chatter',
      name: 'chatterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chatTitle {
    return Intl.message(
      'Chat',
      name: 'chatTitle',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get moreTitle {
    return Intl.message(
      'More',
      name: 'moreTitle',
      desc: '',
      args: [],
    );
  }

  /// `Type your message...`
  String get chatInputHint {
    return Intl.message(
      'Type your message...',
      name: 'chatInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Character A`
  String get defaultCharacterGirlName {
    return Intl.message(
      'Character A',
      name: 'defaultCharacterGirlName',
      desc: '',
      args: [],
    );
  }

  /// `<chatter> is a lively and natural extrovert, always full of energy. A friend of <user>, <chatter> thoroughly enjoys spending time and engaging in conversations with friends. Genuine interest in listening to other people's stories is a hallmark of <chatter>'s personality.`
  String get defaultCharacterGirlDescription {
    return Intl.message(
      '<chatter> is a lively and natural extrovert, always full of energy. A friend of <user>, <chatter> thoroughly enjoys spending time and engaging in conversations with friends. Genuine interest in listening to other people\'s stories is a hallmark of <chatter>\'s personality.',
      name: 'defaultCharacterGirlDescription',
      desc: '',
      args: [],
    );
  }

  /// `Character B`
  String get defaultCharacterBoyName {
    return Intl.message(
      'Character B',
      name: 'defaultCharacterBoyName',
      desc: '',
      args: [],
    );
  }

  /// `<chatter> has a soft heart and is an excellent listener. A friend of <user>, <chatter> is always there for their friends in times of need, ready to lend a sympathetic ear to their troubles.`
  String get defaultCharacterBoyDescription {
    return Intl.message(
      '<chatter> has a soft heart and is an excellent listener. A friend of <user>, <chatter> is always there for their friends in times of need, ready to lend a sympathetic ear to their troubles.',
      name: 'defaultCharacterBoyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Usage Policies`
  String get usagePolicy {
    return Intl.message(
      'Usage Policies',
      name: 'usagePolicy',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chatOption {
    return Intl.message(
      'Chat',
      name: 'chatOption',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Exit app`
  String get exitApp {
    return Intl.message(
      'Exit app',
      name: 'exitApp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to exit app?`
  String get exitAppConfirm {
    return Intl.message(
      'Are you sure to exit app?',
      name: 'exitAppConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteOption {
    return Intl.message(
      'Delete',
      name: 'deleteOption',
      desc: '',
      args: [],
    );
  }

  /// `Delete Chatter`
  String get deleteChatter {
    return Intl.message(
      'Delete Chatter',
      name: 'deleteChatter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm chatter deletion?\nAll chat history will be lost!`
  String get deleteChatterConfirm {
    return Intl.message(
      'Confirm chatter deletion?\nAll chat history will be lost!',
      name: 'deleteChatterConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Chat`
  String get deleteChatroom {
    return Intl.message(
      'Delete Chat',
      name: 'deleteChatroom',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Chat deletion?\nAll chat history will be lost!`
  String get deleteChatroomConfirm {
    return Intl.message(
      'Confirm Chat deletion?\nAll chat history will be lost!',
      name: 'deleteChatroomConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteChatOption {
    return Intl.message(
      'Delete',
      name: 'deleteChatOption',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editChatOption {
    return Intl.message(
      'Edit',
      name: 'editChatOption',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copyChatOption {
    return Intl.message(
      'Copy',
      name: 'copyChatOption',
      desc: '',
      args: [],
    );
  }

  /// `New Chatter`
  String get newChatter {
    return Intl.message(
      'New Chatter',
      name: 'newChatter',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Describe about your Chatter's personality, background, or anything else you'd like to!`
  String get descriptionHint {
    return Intl.message(
      'Describe about your Chatter\'s personality, background, or anything else you\'d like to!',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Background`
  String get background {
    return Intl.message(
      'Background',
      name: 'background',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a static image, not formats like GIF!`
  String get toastSelectStaticImage {
    return Intl.message(
      'Please choose a static image, not formats like GIF!',
      name: 'toastSelectStaticImage',
      desc: '',
      args: [],
    );
  }

  /// `No one has chatted yet in this room.`
  String get chatroomDefaultMessage {
    return Intl.message(
      'No one has chatted yet in this room.',
      name: 'chatroomDefaultMessage',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet.\nStart new chat with {characterName}`
  String chatPlaceHolderMessage(Object characterName) {
    return Intl.message(
      'No messages yet.\nStart new chat with $characterName',
      name: 'chatPlaceHolderMessage',
      desc: '',
      args: [characterName],
    );
  }

  /// `No chatter has found!`
  String get noChatterFound {
    return Intl.message(
      'No chatter has found!',
      name: 'noChatterFound',
      desc: '',
      args: [],
    );
  }

  /// `Usage Policies`
  String get usagePolicyTitle {
    return Intl.message(
      'Usage Policies',
      name: 'usagePolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `ChatterCrafting Usage Policies`
  String get usagePolicySubTitle {
    return Intl.message(
      'ChatterCrafting Usage Policies',
      name: 'usagePolicySubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our application ("App") provides a platform for users to communicate with virtual characters through text-based conversations. This Usage Policy governs your use of our App.`
  String get usagePolicy1 {
    return Intl.message(
      'Our application ("App") provides a platform for users to communicate with virtual characters through text-based conversations. This Usage Policy governs your use of our App.',
      name: 'usagePolicy1',
      desc: '',
      args: [],
    );
  }

  /// `1. Acceptance of Usage Policy`
  String get usagePolicy2 {
    return Intl.message(
      '1. Acceptance of Usage Policy',
      name: 'usagePolicy2',
      desc: '',
      args: [],
    );
  }

  /// `By using our App, you confirm that you accept this Usage Policy and agree to comply with it. If you do not agree to this policy, you must not use our App. We recommend that you print a copy of this Usage Policy for future reference.`
  String get usagePolicy3 {
    return Intl.message(
      'By using our App, you confirm that you accept this Usage Policy and agree to comply with it. If you do not agree to this policy, you must not use our App. We recommend that you print a copy of this Usage Policy for future reference.',
      name: 'usagePolicy3',
      desc: '',
      args: [],
    );
  }

  /// `2. Prohibited Uses`
  String get usagePolicy4 {
    return Intl.message(
      '2. Prohibited Uses',
      name: 'usagePolicy4',
      desc: '',
      args: [],
    );
  }

  /// `You may use our App only for lawful purposes. You may not use our App:\n- In any way that breaches any applicable local, national or international law or regulation.\n- To send, knowingly receive, upload, download, use or re-use any material that does not comply with our content standards.\n- To transmit, or procure the sending of, any unsolicited or unauthorized advertising or promotional material or any other form of similar solicitation (spam).`
  String get usagePolicy5 {
    return Intl.message(
      'You may use our App only for lawful purposes. You may not use our App:\n- In any way that breaches any applicable local, national or international law or regulation.\n- To send, knowingly receive, upload, download, use or re-use any material that does not comply with our content standards.\n- To transmit, or procure the sending of, any unsolicited or unauthorized advertising or promotional material or any other form of similar solicitation (spam).',
      name: 'usagePolicy5',
      desc: '',
      args: [],
    );
  }

  /// `3. Content Standards`
  String get usagePolicy6 {
    return Intl.message(
      '3. Content Standards',
      name: 'usagePolicy6',
      desc: '',
      args: [],
    );
  }

  /// `These content standards apply to any and all user-generated content on our App. User-generated content must not:\n- Contain any material that is defamatory, obscene, offensive, hateful or inflammatory.\n- Promote sexually explicit material, violence or discrimination based on race, sex, religion, nationality, disability, sexual orientation or age.\n- Infringe any copyright, database right or trademark of any other person.\n- Be likely to deceive any person or be used to impersonate any person, or to misrepresent your identity or affiliation with any person.`
  String get usagePolicy7 {
    return Intl.message(
      'These content standards apply to any and all user-generated content on our App. User-generated content must not:\n- Contain any material that is defamatory, obscene, offensive, hateful or inflammatory.\n- Promote sexually explicit material, violence or discrimination based on race, sex, religion, nationality, disability, sexual orientation or age.\n- Infringe any copyright, database right or trademark of any other person.\n- Be likely to deceive any person or be used to impersonate any person, or to misrepresent your identity or affiliation with any person.',
      name: 'usagePolicy7',
      desc: '',
      args: [],
    );
  }

  /// `4. Breach of This Usage Policy`
  String get usagePolicy8 {
    return Intl.message(
      '4. Breach of This Usage Policy',
      name: 'usagePolicy8',
      desc: '',
      args: [],
    );
  }

  /// `Failure to comply with this Usage Policy constitutes a material breach of the terms of use upon which you are permitted to use our App, and may result in our taking all or any of the following actions:\n- Immediate, temporary or permanent withdrawal of your right to use our App.\n- Legal proceedings against you for reimbursement of all costs on an indemnity basis resulting from the breach.\n- Further legal action against you.\nWe exclude liability for actions taken in response to breaches of this Usage Policy.`
  String get usagePolicy9 {
    return Intl.message(
      'Failure to comply with this Usage Policy constitutes a material breach of the terms of use upon which you are permitted to use our App, and may result in our taking all or any of the following actions:\n- Immediate, temporary or permanent withdrawal of your right to use our App.\n- Legal proceedings against you for reimbursement of all costs on an indemnity basis resulting from the breach.\n- Further legal action against you.\nWe exclude liability for actions taken in response to breaches of this Usage Policy.',
      name: 'usagePolicy9',
      desc: '',
      args: [],
    );
  }

  /// `5. Changes to the Usage Policy`
  String get usagePolicy10 {
    return Intl.message(
      '5. Changes to the Usage Policy',
      name: 'usagePolicy10',
      desc: '',
      args: [],
    );
  }

  /// `We may revise this Usage Policy at any time by amending this page. You are expected to check this page regularly to take notice of any changes we made, as they are legally binding on you.`
  String get usagePolicy11 {
    return Intl.message(
      'We may revise this Usage Policy at any time by amending this page. You are expected to check this page regularly to take notice of any changes we made, as they are legally binding on you.',
      name: 'usagePolicy11',
      desc: '',
      args: [],
    );
  }

  /// `6. Third-Party Services and APIs`
  String get usagePolicy12 {
    return Intl.message(
      '6. Third-Party Services and APIs',
      name: 'usagePolicy12',
      desc: '',
      args: [],
    );
  }

  /// `In delivering the services of our App, we utilize the API of ChatGPT. Consequently, we adhere to the usage policies of ChatGPT. You can review the ChatGPT's Usage Policy `
  String get usagePolicy13 {
    return Intl.message(
      'In delivering the services of our App, we utilize the API of ChatGPT. Consequently, we adhere to the usage policies of ChatGPT. You can review the ChatGPT\'s Usage Policy ',
      name: 'usagePolicy13',
      desc: '',
      args: [],
    );
  }

  /// `here,`
  String get usagePolicy14 {
    return Intl.message(
      'here,',
      name: 'usagePolicy14',
      desc: '',
      args: [],
    );
  }

  /// ` By using our App, you also agree to abide by the usage policies of ChatGPT.\nYour use of third-party services and APIs, including ChatGPT, PaLM API is subject to the terms and conditions, privacy policies, and other policies and agreements applicable to such third-party services. We encourage you to read those documents carefully.`
  String get usagePolicy15 {
    return Intl.message(
      ' By using our App, you also agree to abide by the usage policies of ChatGPT.\nYour use of third-party services and APIs, including ChatGPT, PaLM API is subject to the terms and conditions, privacy policies, and other policies and agreements applicable to such third-party services. We encourage you to read those documents carefully.',
      name: 'usagePolicy15',
      desc: '',
      args: [],
    );
  }

  /// `No ChatRooms yet :)`
  String get chatroomPlaceholder {
    return Intl.message(
      'No ChatRooms yet :)',
      name: 'chatroomPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `You don't have enough TokenGems! Please purchase more TokenGems to continue chatting.`
  String get insufficientTokenGem {
    return Intl.message(
      'You don\'t have enough TokenGems! Please purchase more TokenGems to continue chatting.',
      name: 'insufficientTokenGem',
      desc: '',
      args: [],
    );
  }

  /// `Sign in success`
  String get signInSuccess {
    return Intl.message(
      'Sign in success',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign in fail`
  String get signInFail {
    return Intl.message(
      'Sign in fail',
      name: 'signInFail',
      desc: '',
      args: [],
    );
  }

  /// `Sign in canceled`
  String get signInCanceled {
    return Intl.message(
      'Sign in canceled',
      name: 'signInCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Search chatter name`
  String get searchChatter {
    return Intl.message(
      'Search chatter name',
      name: 'searchChatter',
      desc: '',
      args: [],
    );
  }

  /// `Chat Backup`
  String get chatBackup {
    return Intl.message(
      'Chat Backup',
      name: 'chatBackup',
      desc: '',
      args: [],
    );
  }

  /// `Chat Restore`
  String get chatRestore {
    return Intl.message(
      'Chat Restore',
      name: 'chatRestore',
      desc: '',
      args: [],
    );
  }

  /// `Chatrooms`
  String get chatRooms {
    return Intl.message(
      'Chatrooms',
      name: 'chatRooms',
      desc: '',
      args: [],
    );
  }

  /// `OS`
  String get os {
    return Intl.message(
      'OS',
      name: 'os',
      desc: '',
      args: [],
    );
  }

  /// `· ChatterCrafting does not automatically back up your chats to the server, so if you want to restore your chat data on another device, you can manually back up your chats and then restore them.`
  String get chatterCraftingBackupPolicy1 {
    return Intl.message(
      '· ChatterCrafting does not automatically back up your chats to the server, so if you want to restore your chat data on another device, you can manually back up your chats and then restore them.',
      name: 'chatterCraftingBackupPolicy1',
      desc: '',
      args: [],
    );
  }

  /// `Want to backup your chats? If you already have data backed up on your server, this will overwrite it.`
  String get chatBackupConfirm {
    return Intl.message(
      'Want to backup your chats? If you already have data backed up on your server, this will overwrite it.',
      name: 'chatBackupConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Want to recover chats you've backed up to the server? It'll overwrite your existing local data, and the app will restart after the recovery.`
  String get chatRestoreConfirm {
    return Intl.message(
      'Want to recover chats you\'ve backed up to the server? It\'ll overwrite your existing local data, and the app will restart after the recovery.',
      name: 'chatRestoreConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Backing up chat..`
  String get backingUp {
    return Intl.message(
      'Backing up chat..',
      name: 'backingUp',
      desc: '',
      args: [],
    );
  }

  /// `Restoring chat..`
  String get restoringChat {
    return Intl.message(
      'Restoring chat..',
      name: 'restoringChat',
      desc: '',
      args: [],
    );
  }

  /// `Done!`
  String get doneExc {
    return Intl.message(
      'Done!',
      name: 'doneExc',
      desc: '',
      args: [],
    );
  }

  /// `Done!\nRestarting app..`
  String get doneRestart {
    return Intl.message(
      'Done!\nRestarting app..',
      name: 'doneRestart',
      desc: '',
      args: [],
    );
  }

  /// `ChatGPT Server is overloaded now.`
  String get chatGPTServer {
    return Intl.message(
      'ChatGPT Server is overloaded now.',
      name: 'chatGPTServer',
      desc: '',
      args: [],
    );
  }

  /// `No chat was backed up!`
  String get noDataFound {
    return Intl.message(
      'No chat was backed up!',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Operation Failed!`
  String get operationFailed {
    return Intl.message(
      'Operation Failed!',
      name: 'operationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Paste chatter code here`
  String get pasteCode {
    return Intl.message(
      'Paste chatter code here',
      name: 'pasteCode',
      desc: '',
      args: [],
    );
  }

  /// `Want to export your chatter? This will create shareable chatter code.`
  String get exportConfirm {
    return Intl.message(
      'Want to export your chatter? This will create shareable chatter code.',
      name: 'exportConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Exporting..`
  String get exporting {
    return Intl.message(
      'Exporting..',
      name: 'exporting',
      desc: '',
      args: [],
    );
  }

  /// `Importing..`
  String get importing {
    return Intl.message(
      'Importing..',
      name: 'importing',
      desc: '',
      args: [],
    );
  }

  /// `Chatter code`
  String get chatterCode {
    return Intl.message(
      'Chatter code',
      name: 'chatterCode',
      desc: '',
      args: [],
    );
  }

  /// `You can share this chatter code with others. (This chatter code is only valid for one week.)`
  String get chatterCodeExplain {
    return Intl.message(
      'You can share this chatter code with others. (This chatter code is only valid for one week.)',
      name: 'chatterCodeExplain',
      desc: '',
      args: [],
    );
  }

  /// `You have reached your daily limit! Backup and restoration of chats are permitted up to 5 times a day. We apologize for any inconvenience caused.`
  String get reachedBackupLimit {
    return Intl.message(
      'You have reached your daily limit! Backup and restoration of chats are permitted up to 5 times a day. We apologize for any inconvenience caused.',
      name: 'reachedBackupLimit',
      desc: '',
      args: [],
    );
  }

  /// `· Please note that backing up and restoring chats are limited to 5 operations per day.`
  String get chatterCraftingBackupPolicy2 {
    return Intl.message(
      '· Please note that backing up and restoring chats are limited to 5 operations per day.',
      name: 'chatterCraftingBackupPolicy2',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get updateAvailable {
    return Intl.message(
      'Update Available',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the app is available. Please update your app.`
  String get updateAvailableExplain {
    return Intl.message(
      'A new version of the app is available. Please update your app.',
      name: 'updateAvailableExplain',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNow {
    return Intl.message(
      'Update Now',
      name: 'updateNow',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `· This will delete your account data from ChatterCrafting.`
  String get deleteAccountPolicy1 {
    return Intl.message(
      '· This will delete your account data from ChatterCrafting.',
      name: 'deleteAccountPolicy1',
      desc: '',
      args: [],
    );
  }

  /// `· All chat data will be removed after your account is deleted, and the app will then restart.`
  String get deleteAccountPolicy2 {
    return Intl.message(
      '· All chat data will be removed after your account is deleted, and the app will then restart.',
      name: 'deleteAccountPolicy2',
      desc: '',
      args: [],
    );
  }

  /// `Do you wish to delete your account data from ChatterCrafting? All chat data will be removed, and the app will then restart.`
  String get deleteAccountConfirm {
    return Intl.message(
      'Do you wish to delete your account data from ChatterCrafting? All chat data will be removed, and the app will then restart.',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your account data...`
  String get deleting {
    return Intl.message(
      'Deleting your account data...',
      name: 'deleting',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Chatters`
  String get chatters {
    return Intl.message(
      'Chatters',
      name: 'chatters',
      desc: '',
      args: [],
    );
  }

  /// `This is invalid Chatter code`
  String get chatterCodeInvalid {
    return Intl.message(
      'This is invalid Chatter code',
      name: 'chatterCodeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The purchase of TokenGem is temporarily disabled. We're sorry for the inconvenience, we'll do our best to restore the service.`
  String get tokenReachedLimitation {
    return Intl.message(
      'The purchase of TokenGem is temporarily disabled. We\'re sorry for the inconvenience, we\'ll do our best to restore the service.',
      name: 'tokenReachedLimitation',
      desc: '',
      args: [],
    );
  }

  /// `Spending History`
  String get spendingHistory {
    return Intl.message(
      'Spending History',
      name: 'spendingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Total used TokenGem`
  String get totalUsedTokenGem {
    return Intl.message(
      'Total used TokenGem',
      name: 'totalUsedTokenGem',
      desc: '',
      args: [],
    );
  }

  /// `API Key Management`
  String get manageAPIKey {
    return Intl.message(
      'API Key Management',
      name: 'manageAPIKey',
      desc: '',
      args: [],
    );
  }

  /// `OpenAI (ChatGPT)`
  String get openAI {
    return Intl.message(
      'OpenAI (ChatGPT)',
      name: 'openAI',
      desc: '',
      args: [],
    );
  }

  /// `OpenAI API Key`
  String get openAIAPIKey {
    return Intl.message(
      'OpenAI API Key',
      name: 'openAIAPIKey',
      desc: '',
      args: [],
    );
  }

  /// `Paste the API key here`
  String get pasteAPIKey {
    return Intl.message(
      'Paste the API key here',
      name: 'pasteAPIKey',
      desc: '',
      args: [],
    );
  }

  /// `Never leak the API key to anywhere else!`
  String get neverLeakAPIKey {
    return Intl.message(
      'Never leak the API key to anywhere else!',
      name: 'neverLeakAPIKey',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerAPI {
    return Intl.message(
      'Register',
      name: 'registerAPI',
      desc: '',
      args: [],
    );
  }

  /// `is saved.`
  String get isSaved {
    return Intl.message(
      'is saved.',
      name: 'isSaved',
      desc: '',
      args: [],
    );
  }

  /// `Text has been pasted.`
  String get textIsPasted {
    return Intl.message(
      'Text has been pasted.',
      name: 'textIsPasted',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OpenAI API Key`
  String get openAIAPIKeyErrorTitle {
    return Intl.message(
      'Invalid OpenAI API Key',
      name: 'openAIAPIKeyErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your OpenAI API Key is not registered yet. Would you like to go to the page where you can register it?`
  String get openAIAPIisNotRegistered {
    return Intl.message(
      'Your OpenAI API Key is not registered yet. Would you like to go to the page where you can register it?',
      name: 'openAIAPIisNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Your OpenAI API Key is invalid. Would you like to go to the page where you can register it?`
  String get openAIAPIisInvalid {
    return Intl.message(
      'Your OpenAI API Key is invalid. Would you like to go to the page where you can register it?',
      name: 'openAIAPIisInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Instruction System Prompt`
  String get instructionSystemPrompt {
    return Intl.message(
      'Instruction System Prompt',
      name: 'instructionSystemPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Provide a prompt to instruct ChatGPT on what you want it to do. For example, if you say "Do Role-playing" here, ChatGPT will do its best to role-play`
  String get instructionSystemPromptHint {
    return Intl.message(
      'Provide a prompt to instruct ChatGPT on what you want it to do. For example, if you say "Do Role-playing" here, ChatGPT will do its best to role-play',
      name: 'instructionSystemPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Chatter Description Prompt`
  String get chatterPrompt {
    return Intl.message(
      'Chatter Description Prompt',
      name: 'chatterPrompt',
      desc: '',
      args: [],
    );
  }

  /// `This prompt is about your chatter. Describe about your Chatter's personality, background, or anything else you'd like to!`
  String get chatterPromptHint {
    return Intl.message(
      'This prompt is about your chatter. Describe about your Chatter\'s personality, background, or anything else you\'d like to!',
      name: 'chatterPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Model`
  String get selectModel {
    return Intl.message(
      'Select Model',
      name: 'selectModel',
      desc: '',
      args: [],
    );
  }

  /// `The name by which you will be recognized`
  String get chatterRecognizeUserName {
    return Intl.message(
      'The name by which you will be recognized',
      name: 'chatterRecognizeUserName',
      desc: '',
      args: [],
    );
  }

  /// `Chatter's First Message`
  String get firstMessageLabel {
    return Intl.message(
      'Chatter\'s First Message',
      name: 'firstMessageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Customize Chatter's first message if you wish, or leave it empty if you prefer not to.`
  String get firstMessageHint {
    return Intl.message(
      'Customize Chatter\'s first message if you wish, or leave it empty if you prefer not to.',
      name: 'firstMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Temperature (Randomness)`
  String get temperatureLabel {
    return Intl.message(
      'Temperature (Randomness)',
      name: 'temperatureLabel',
      desc: '',
      args: [],
    );
  }

  /// `Context Prompt`
  String get contextPrompt {
    return Intl.message(
      'Context Prompt',
      name: 'contextPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Context Prompt hint here`
  String get contextPromptHint {
    return Intl.message(
      'Context Prompt hint here',
      name: 'contextPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Google (PaLM)`
  String get googlePaLM {
    return Intl.message(
      'Google (PaLM)',
      name: 'googlePaLM',
      desc: '',
      args: [],
    );
  }

  /// `PaLM API Key`
  String get paLMAPIKey {
    return Intl.message(
      'PaLM API Key',
      name: 'paLMAPIKey',
      desc: '',
      args: [],
    );
  }

  /// `Context Prompt`
  String get paLMContextPromptLabel {
    return Intl.message(
      'Context Prompt',
      name: 'paLMContextPromptLabel',
      desc: '',
      args: [],
    );
  }

  /// `Provide a prompt to guide PaLM on what you want it to do. For example, if you say "Do Role-playing" here, PaLM will do its best to role-play`
  String get paLMContextPromptHint {
    return Intl.message(
      'Provide a prompt to guide PaLM on what you want it to do. For example, if you say "Do Role-playing" here, PaLM will do its best to role-play',
      name: 'paLMContextPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Example Conversation Prompt`
  String get paLMExamplePromptLabel {
    return Intl.message(
      'Example Conversation Prompt',
      name: 'paLMExamplePromptLabel',
      desc: '',
      args: [],
    );
  }

  /// `This prompt gives PaLM an example of what it should generate in conversation. Both input and output example prompts must be provided simultaneously. If not, leave both fields empty`
  String get paLMExamplePromptHint {
    return Intl.message(
      'This prompt gives PaLM an example of what it should generate in conversation. Both input and output example prompts must be provided simultaneously. If not, leave both fields empty',
      name: 'paLMExamplePromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Example Input`
  String get paLMExampleInputLabel {
    return Intl.message(
      'Example Input',
      name: 'paLMExampleInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter an example input for the conversation`
  String get paLMExampleInputHint {
    return Intl.message(
      'Enter an example input for the conversation',
      name: 'paLMExampleInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Example Output`
  String get paLMExampleOutputLabel {
    return Intl.message(
      'Example Output',
      name: 'paLMExampleOutputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter an example of what PaLM should generate as output`
  String get paLMExampleOutputHint {
    return Intl.message(
      'Enter an example of what PaLM should generate as output',
      name: 'paLMExampleOutputHint',
      desc: '',
      args: [],
    );
  }

  /// `Invalid PaLM API Key`
  String get paLMAPIKeyErrorTitle {
    return Intl.message(
      'Invalid PaLM API Key',
      name: 'paLMAPIKeyErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your PaLM API Key is invalid. Would you like to go to the page where you can register it?`
  String get paLMAPIisInvalid {
    return Intl.message(
      'Your PaLM API Key is invalid. Would you like to go to the page where you can register it?',
      name: 'paLMAPIisInvalid',
      desc: '',
      args: [],
    );
  }

  /// `ChatGPT`
  String get chatGPTDefaultCharacterName {
    return Intl.message(
      'ChatGPT',
      name: 'chatGPTDefaultCharacterName',
      desc: '',
      args: [],
    );
  }

  /// `Hey there! How have you been?`
  String get defaultCharacterGirlFirstMessage {
    return Intl.message(
      'Hey there! How have you been?',
      name: 'defaultCharacterGirlFirstMessage',
      desc: '',
      args: [],
    );
  }

  /// `Draft a conversation between <chatter> and <user>.`
  String get defaultCharacterSystemPrompt {
    return Intl.message(
      'Draft a conversation between <chatter> and <user>.',
      name: 'defaultCharacterSystemPrompt',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `ChatRoom Settings`
  String get chatRoomSetting {
    return Intl.message(
      'ChatRoom Settings',
      name: 'chatRoomSetting',
      desc: '',
      args: [],
    );
  }

  /// `Enable Markdown Rendering`
  String get enableMarkdownRendering {
    return Intl.message(
      'Enable Markdown Rendering',
      name: 'enableMarkdownRendering',
      desc: '',
      args: [],
    );
  }

  /// `Font Size`
  String get fontSize {
    return Intl.message(
      'Font Size',
      name: 'fontSize',
      desc: '',
      args: [],
    );
  }

  /// `Chatter's Font Size`
  String get chatterFontSize {
    return Intl.message(
      'Chatter\'s Font Size',
      name: 'chatterFontSize',
      desc: '',
      args: [],
    );
  }

  /// `User's Font Size`
  String get userFontSize {
    return Intl.message(
      'User\'s Font Size',
      name: 'userFontSize',
      desc: '',
      args: [],
    );
  }

  /// `User's Font Color`
  String get userFontColor {
    return Intl.message(
      'User\'s Font Color',
      name: 'userFontColor',
      desc: '',
      args: [],
    );
  }

  /// `Chatter's Font Color`
  String get chatterFontColor {
    return Intl.message(
      'Chatter\'s Font Color',
      name: 'chatterFontColor',
      desc: '',
      args: [],
    );
  }

  /// `User's ChatBox Background Color`
  String get userChatBoxBackgroundColor {
    return Intl.message(
      'User\'s ChatBox Background Color',
      name: 'userChatBoxBackgroundColor',
      desc: '',
      args: [],
    );
  }

  /// `Chatter's ChatBox Background Color`
  String get chatterChatBoxBackgroundColor {
    return Intl.message(
      'Chatter\'s ChatBox Background Color',
      name: 'chatterChatBoxBackgroundColor',
      desc: '',
      args: [],
    );
  }

  /// `ChatRoom Background Color`
  String get chatroomBackgroundColor {
    return Intl.message(
      'ChatRoom Background Color',
      name: 'chatroomBackgroundColor',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Reset to Defaults`
  String get resetToDefaults {
    return Intl.message(
      'Reset to Defaults',
      name: 'resetToDefaults',
      desc: '',
      args: [],
    );
  }

  /// `EULA`
  String get eULA {
    return Intl.message(
      'EULA',
      name: 'eULA',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
