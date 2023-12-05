import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../constants/constants.dart';
import '../pages/pages.dart';

enum OnExitDialogClicked{
  onCancelClicked,
  onYesClicked
}

Widget exitDialog(BuildContext context){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        color: ColorConstants.themeColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              Intl.message('exitApp'),
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              Intl.message('exitAppConfirm'),
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnExitDialogClicked.onCancelClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.cancel,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message('cancel'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnExitDialogClicked.onYesClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message('yes'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ],
  );
}

enum OnYesOrNoDialog{
  onCancelClicked,
  onYesClicked
}

Widget yesOrNoDialog(
    BuildContext context,
    IconData icon,
    String title,
    String message,
    ){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        color: ColorConstants.themeColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              message,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnYesOrNoDialog.onCancelClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.cancel,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message('cancel'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnYesOrNoDialog.onYesClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message('yes'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ],
  );
}

enum OnFriendDialogClicked{
  onEditClicked,
  onDeleteClicked
}

Widget friendDialog(BuildContext context,String friendName){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        height: 50,
        color: Colors.transparent,
        child: Text(
          friendName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pop(context, OnFriendDialogClicked.onEditClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("editProfile"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      const SizedBox(height: 1),
      InkWell(
        onTap: () {
          Navigator.pop(context, OnFriendDialogClicked.onDeleteClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("deleteOption"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ],
  );
}

enum OnChatRoomDialogClicked{
  onDeleteClicked
}

Widget chatRoomDialog(BuildContext context,String friendName){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        height: 50,
        color: Colors.transparent,
        child: Text(
          friendName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pop(context, OnChatRoomDialogClicked.onDeleteClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("deleteOption"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ],
  );
}

enum OnDeleteCharacterDialogClicked{
  onCancelClicked,
  onYesClicked
}

Widget deleteCharacterDialog(BuildContext context){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        color: ColorConstants.themeColor,
        padding: const EdgeInsets.only(bottom: 10, top: 10,right: 10,left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              Intl.message("deleteChatter"),
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              Intl.message("deleteChatterConfirm"),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnDeleteCharacterDialogClicked.onCancelClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.cancel,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message("cancel"),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnDeleteCharacterDialogClicked.onYesClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message("yes"),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ],
  );
}


enum OnDeleteChatRoomDialogClicked{
  onCancelClicked,
  onYesClicked
}

Widget deleteChatRoomDialog(BuildContext context){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        color: ColorConstants.themeColor,
        padding: const EdgeInsets.only(bottom: 10, top: 10,right: 10,left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              Intl.message("deleteChatroom"),
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              Intl.message("deleteChatroomConfirm"),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnDeleteChatRoomDialogClicked.onCancelClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.cancel,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message("cancel"),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnDeleteChatRoomDialogClicked.onYesClicked);
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: ColorConstants.primaryColor,
              ),
            ),
            Text(
              Intl.message("yes"),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ],
  );
}

enum OnChatDialogClicked{
  onEditClicked,
  onDeleteClicked,
  onCopyClicked
}

Widget chatDialog(BuildContext context){
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.pop(context, OnChatDialogClicked.onEditClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("editChatOption"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      const SizedBox(height: 1),
      InkWell(
        onTap: () {
          Navigator.pop(context, OnChatDialogClicked.onDeleteClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("deleteChatOption"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      const SizedBox(height: 1),
      InkWell(
        onTap: () {
          Navigator.pop(context, OnChatDialogClicked.onCopyClicked);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 50,
          color: Colors.transparent,
          child: Text(
            Intl.message("copyChatOption"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ],
  );
}

enum OnExportCharacterDialogClicked{
  onCloseClicked,
  onCopyClicked,
}

enum OnCancelSubscriptionDialogClicked {
  onCancelClicked,
  onYesClicked
}

Widget cancelSubscriptionDialog(
    BuildContext context,
    ) {
  return SimpleDialog(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Slightly increased border radius
    contentPadding: const EdgeInsets.all(16.0), // Uniform padding
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(bottom: 20.0), // Increased bottom padding for visual spacing
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            const Icon(
              Icons.warning_rounded,
              size: 40, // Increase icon size for better visibility
              color: ColorConstants.themeColor,
            ),
            const SizedBox(height: 10),
            Text(
              Intl.message("cancelSubscription"),
              style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              Intl.message("cancelSubscriptionDescription"),
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.center, // Centered text alignment for better readability
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      const Divider(),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnCancelSubscriptionDialogClicked.onCancelClicked);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              Intl.message('no'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.close,
              color: ColorConstants.primaryColor,
            ),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          Navigator.pop(context, OnCancelSubscriptionDialogClicked.onYesClicked);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              Intl.message('yes'),
              style: const TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.arrow_forward,
              color: ColorConstants.primaryColor,
            ),
          ],
        ),
      ),
    ],
  );
}