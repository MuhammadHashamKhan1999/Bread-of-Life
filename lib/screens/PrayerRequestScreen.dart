import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/PrayerRequestResponse.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class PrayerRequestScreen extends StatefulWidget {
  PrayerRequestScreen(this.text);

  String text;

  @override
  _PrayerRequestScreenState createState() => _PrayerRequestScreenState();
}

class _PrayerRequestScreenState extends State<PrayerRequestScreen> {
  int? _groupValue = -1;

  var _msgController = TextEditingController();
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(t.prayer_request_form),
        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "How can we pray for you? *",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                keyboardType: TextInputType.multiline,
                controller: _msgController,
                minLines: 6,
                maxLines: 6,
                decoration: InputDecoration(
                    fillColor: Color(0xfff3f0f0),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Enter Message.."),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Would you like someone to follow up with you? *",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Expanded(
                  child: RadioListTile(
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (dynamic value) {
                      setState(() {
                        _groupValue = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text("Yes",style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 0,
                    groupValue: _groupValue,
                    onChanged: (dynamic value) {
                      setState(() {
                        _groupValue = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text('No', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "First Name *",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _firstNameController,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                    fillColor: Color(0xfff3f0f0),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Enter Name"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Last Name *",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _lastNameController,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                    fillColor: Color(0xfff3f0f0),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Enter Name"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email Address",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: _emailController,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                    fillColor: Color(0xfff3f0f0),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Enter Email"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Phone Number",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: _numberController,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                    fillColor: Color(0xfff3f0f0),
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Phone Number"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                onTap: (){
                  if(_isValidated())
                    _prayerRequestAPI();
                },
                child: Container(
                  width: 180,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:  MyColors.primary,
                  ),
                  child: Center(child: Text(
                    t.submit,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 12), child: Text('Please wait...')),
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

  void _closeLoaderDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _showErrorDialog(String msg){
    Widget continueButton = MaterialButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(msg),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool _isValidated(){

    if(_msgController.text.isEmpty){
      _showErrorDialog("Enter message for prayer request");
      return false;
    } else if(_groupValue == -1){
      _showErrorDialog("Select follow up status");
      return false;
    } else if(_firstNameController.text.isEmpty){
      _showErrorDialog("First name is required");
      return false;
    } else if(_lastNameController.text.isEmpty){
      _showErrorDialog("Last name is required");
      return false;
    } /*else if(_emailController.text.isEmpty){
      _showErrorDialog("Email address is required");
      return false;
    } else if(_numberController.text.isEmpty){
      _showErrorDialog("Phone number is required");
      return false;
    }*/

   return true;
  }

  // API method
  void _prayerRequestAPI() async {
    _showLoaderDialog(context);
    Map<String, String> headers = {"Content-type": "application/json"};

    Map data = {
      "pray_for_you": _msgController.text,
      "follow_up": _groupValue == 1 ? 'Yes' : "No",
      "firstname": _firstNameController.text,
      "lastname": _lastNameController.text,
      "email": _emailController.text,
      "phone": _numberController.text,
    };

    String requestBody = json.encode(data);
    Response response = await post(Uri.parse(ApiUrl.PRAYER_REQUEST), headers: headers, body: requestBody);
    final res = prayerRequestResponseFromJson(response.body);
    _closeLoaderDialog(context);
    if (res.status == 200.toString()){
      Fluttertoast.showToast(msg: "Prayer request made successfully",);
      Navigator.of(context).pop();
    } else {
      _showErrorDialog("An error occurred");
    }
  }
}