import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import '../models/chat_room_settings.dart';
import '../models/sqflite/chat_message.dart';
import '../constants/color_constants.dart';

class ChatParser {

  static List<TextSpan> parseMessageContent(String content, ChatMessageType? type) {
    final List<TextSpan> textSpans = [];
    final RegExp italicPattern = RegExp(r'\*([^*]+)\*');
    final matches = italicPattern.allMatches(content).toList();

    int lastMatchEnd = 0;

    for (final match in matches) {
      if (lastMatchEnd < match.start) {
        textSpans.add(TextSpan(
          text: content.substring(lastMatchEnd, match.start),
        ));
      }
      textSpans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
            color: type == null // null in case of used for chatroom
                ? ColorConstants.strongGreyColor
                : type == ChatMessageType.characterMessage
                ? ColorConstants.characterChatItalicGreyColor
                : ColorConstants.userChatItalicWhiteColor
        ),
      ));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < content.length) {
      textSpans.add(TextSpan(
        text: content.substring(lastMatchEnd),
      ));
    }

    return textSpans;
  }

  static String parseMarkDown(String content){
    return content.replaceAll('\n', '\n\n');
  }

  static MarkdownStyleSheet markdownStyleSheet(ChatMessageType chatMessageType, ChatRoomSetting settings) {
    Color color = getMessageTextColor(chatMessageType, settings);

    return MarkdownStyleSheet(
      a: TextStyle(color: color),
      p: TextStyle(
        fontSize: chatMessageType == ChatMessageType.characterMessage
            ? settings.chatterFontSize
            : settings.userFontSize,
        color: color,
      ),
      code: const TextStyle(color: Colors.black),
      h1: TextStyle(fontSize: 24, color: color),
      h2: TextStyle(fontSize: 22, color: color),
      h3: TextStyle(fontSize: 20, color: color),
      h4: TextStyle(fontSize: 18, color: color),
      h5: TextStyle(fontSize: 16, color: color),
      h6: TextStyle(fontSize: 14, color: color),
      em: TextStyle(
          fontStyle: FontStyle.italic,
          color: chatMessageType==ChatMessageType.characterMessage
              ? ColorConstants.characterChatItalicGreyColor
              : ColorConstants.userChatItalicWhiteColor
      ),
      strong: TextStyle(fontWeight: FontWeight.bold, color: color),
      del: TextStyle(decoration: TextDecoration.lineThrough, color: color),
      blockquote: const TextStyle(color: Colors.black),
      img: TextStyle(color: color),
      checkbox: TextStyle(color: color),
      tableHead: TextStyle(color: color),
      tableBody: TextStyle(color: color),
      tableHeadAlign: TextAlign.center,
      tableBorder: TableBorder.all(color: color, width: 1),
      horizontalRuleDecoration: BoxDecoration(color: color),
      codeblockPadding: const EdgeInsets.all(8.0),
      codeblockDecoration: const BoxDecoration(color: ColorConstants.markdownCodeBoxColor),
      textScaleFactor: 1.0,
      textAlign: WrapAlignment.start,
    );
  }


  static Color getMessageTextColor(ChatMessageType? chatMessageType, ChatRoomSetting settings) {
    return chatMessageType == ChatMessageType.characterMessage
        ? settings.chatterFontColor
        : settings.userFontColor;
  }

}
