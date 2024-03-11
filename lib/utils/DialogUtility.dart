import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DialogUtility {

  static void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 12), child: Text(t.please_wait)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void closeLoaderDialog(BuildContext context) {
    Navigator.pop(context);
  }

}