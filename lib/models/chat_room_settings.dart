import 'package:flutter/material.dart';

import '../constants/sharedpreference_constants.dart';
import '../constants/color_constants.dart';

class ChatRoomSetting{
  bool isRenderMarkdown;
  double chatterFontSize;
  double userFontSize;
  Color chatterFontColor;
  Color userFontColor;
  Color chatterChatBoxBackgroundColor;
  Color userChatBoxBackgroundColor;
  Color chatRoomBackgroundColor;

  ChatRoomSetting({
    required this.isRenderMarkdown,
    required this.chatterFontSize,
    required this.userFontSize,
    required this.chatterFontColor,
    required this.userFontColor,
    required this.chatterChatBoxBackgroundColor,
    required this.userChatBoxBackgroundColor,
    required this.chatRoomBackgroundColor,
  });

  // Setters
  set setIsRenderMarkdown(bool value) => isRenderMarkdown = value;
  set setChatterFontSize(double value) => chatterFontSize = value;
  set setUserFontSize(double value) => userFontSize = value;
  set setChatterFontColor(Color value) => chatterFontColor = value;
  set setUserFontColor(Color value) => userFontColor = value;
  set setChatterChatBoxBackgroundColor(Color value) => chatterChatBoxBackgroundColor = value;
  set setUserChatBoxBackgroundColor(Color value) => userChatBoxBackgroundColor = value;
  set setChatRoomBackgroundColor(Color value) => chatRoomBackgroundColor = value;

  ChatRoomSetting.copy(ChatRoomSetting other)
      : isRenderMarkdown = other.isRenderMarkdown,
        chatterFontSize = other.chatterFontSize,
        userFontSize = other.userFontSize,
        chatterFontColor = other.chatterFontColor,
        userFontColor = other.userFontColor,
        chatterChatBoxBackgroundColor = other.chatterChatBoxBackgroundColor,
        userChatBoxBackgroundColor = other.userChatBoxBackgroundColor,
        chatRoomBackgroundColor = other.chatRoomBackgroundColor;

  Map<String, dynamic> toJson() {
    return {
      SharedPreferenceConstants.settingIsRenderMarkdown: isRenderMarkdown,
      SharedPreferenceConstants.settingChatterFontSize: chatterFontSize,
      SharedPreferenceConstants.settingUserFontSize: userFontSize,
      SharedPreferenceConstants.settingChatterFontColor: chatterFontColor.value,
      SharedPreferenceConstants.settingUserFontColor: userFontColor.value,
      SharedPreferenceConstants.settingChatterChatBoxBackgroundColor: chatterChatBoxBackgroundColor.value,
      SharedPreferenceConstants.settingUserChatBoxBackgroundColor: userChatBoxBackgroundColor.value,
      SharedPreferenceConstants.settingChatRoomBackgroundColor: chatRoomBackgroundColor.value,
    };
  }

  factory ChatRoomSetting.fromJson(Map<String, dynamic> json) {
    return ChatRoomSetting(
      isRenderMarkdown: json[SharedPreferenceConstants.settingIsRenderMarkdown],
      chatterFontSize: json[SharedPreferenceConstants.settingChatterFontSize],
      userFontSize: json[SharedPreferenceConstants.settingUserFontSize],
      chatterFontColor: Color(json[SharedPreferenceConstants.settingChatterFontColor]),
      userFontColor: Color(json[SharedPreferenceConstants.settingUserFontColor]),
      chatterChatBoxBackgroundColor: Color(json[SharedPreferenceConstants.settingChatterChatBoxBackgroundColor]),
      userChatBoxBackgroundColor: Color(json[SharedPreferenceConstants.settingUserChatBoxBackgroundColor]),
      chatRoomBackgroundColor: Color(json[SharedPreferenceConstants.settingChatRoomBackgroundColor]),
    );
  }

  factory ChatRoomSetting.defaultChatRoomSetting() {
    return ChatRoomSetting(
      isRenderMarkdown: true,
      chatterFontSize: 16,
      userFontSize: 16,
      chatterFontColor: Colors.black,
      userFontColor: Colors.white,
      chatterChatBoxBackgroundColor: ColorConstants.characterChatBoxColor,
      userChatBoxBackgroundColor: ColorConstants.userChatBoxColor,
      chatRoomBackgroundColor: Colors.white,
    );
  }
}