import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static bool isKeyboardShowing() {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0; //MediaQuery.of(context).viewInsets.bottom != 0 if you want to use context
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static String tokenFormat(double value) {
    final numberFormat = NumberFormat("###,##0.##"); // Configure the format as needed
    return numberFormat.format(value);
  }


  static launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
