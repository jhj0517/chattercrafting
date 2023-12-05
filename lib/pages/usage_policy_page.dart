import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../utils/utilities.dart';
import '../constants/color_constants.dart';

class UsagePolicyPage extends StatelessWidget {
  const UsagePolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message("usagePolicyTitle")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: Intl.message("usagePolicySubTitle"),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.themeColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              Intl.message("usagePolicy1"),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy2")), // Policy title #1
            const SizedBox(height: 10),
            _buildUsageContent(Intl.message("usagePolicy3")),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy4")), // Policy title #2
            const SizedBox(height: 10),
            _buildUsageContent(Intl.message("usagePolicy5")),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy6")), // Policy title #3
            const SizedBox(height: 10),
            _buildUsageContent(Intl.message("usagePolicy7")),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy8")), // Policy title #4
            const SizedBox(height: 10),
            _buildUsageContent(Intl.message("usagePolicy9")),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy10")), // Policy title #5
            const SizedBox(height: 10),
            _buildUsageContent(Intl.message("usagePolicy11")),
            const SizedBox(height: 40),
            _buildUsageTitle(Intl.message("usagePolicy12")), // Policy title #6
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: Intl.message("usagePolicy13"),
                    style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.thickGreyColor
                    ),
                  ),
                  TextSpan(
                    text: Intl.message("usagePolicy14"),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Utilities.launchURL("https://openai.com/policies/usage-policies");
                      },
                  ),
                  TextSpan(
                    text: Intl.message("usagePolicy15"),
                    style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.thickGreyColor
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // More Text Widgets for other paragraphs or sections could go here.
          ],
        ),
      ),
    );
  }

  Widget _buildUsageTitle(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildUsageContent(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: ColorConstants.thickGreyColor
      ),
    );
  }


}
