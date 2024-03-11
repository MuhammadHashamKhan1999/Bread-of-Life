
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/DialogUtility.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = "/contactUsScreen";

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _numberController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _msgController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.contact_us),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 0.0), //  <- you can it to 0.0 for no space
                isDense: true,
                labelText: t.fullname,
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 0.0), //  <- you can it to 0.0 for no space
                isDense: true,
                labelText: t.contact_number,
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 0.0), //  <- you can it to 0.0 for no space
                isDense: true,
                labelText: t.emailaddress,
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 3.0),
                  )
                ],
              ),
              child: Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextField(
                    autofocus: false,
                    controller: _msgController,
                    keyboardType: TextInputType.multiline,
                    minLines: 6,
                    maxLines: 6,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    decoration: new InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      hintText: t.msg,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: InkWell(
                  child: Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        t.submit,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () => {
                    if (_isValidated(context)) {_contactUsAPI(context)}
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidated(BuildContext context) {
    String yourName = _nameController.text;
    String number = _numberController.text;
    String emailAddress = _emailController.text;
    String message = _msgController.text;

    if (yourName.isEmpty) {
      Fluttertoast.showToast(msg: t.err_empty_your_name,);
      return false;
    } else if (number.isEmpty) {
      Fluttertoast.showToast(msg: t.err_empty_number,);
      return false;
    } else if (emailAddress.isEmpty) {
      Fluttertoast.showToast(msg: t.err_empty_email_address,);
      return false;
    } else if (message.isEmpty) {
      Fluttertoast.showToast(msg: t.err_empty_message,);
      return false;
    } else {
      return true;
    }
  }

  Future<void> _contactUsAPI(BuildContext context) async {
    DialogUtility.showLoaderDialog(context);

    String name = _nameController.text;
    String number = _numberController.text;
    String email = _emailController.text;
    String msg = _msgController.text;

    try {
      var data = {
        'name': name,
        'email': email,
        'number': number,
        'message': msg
      };

      Response response = await Dio().post(ApiUrl.CONTACT_US_FORM, data: data);
      print(response);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    DialogUtility.closeLoaderDialog(context);
    Fluttertoast.showToast(msg: t.thaks_for_contacting,);
    Navigator.of(context).pop();
  }
}
