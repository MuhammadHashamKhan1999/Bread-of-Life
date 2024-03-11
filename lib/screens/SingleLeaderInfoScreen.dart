import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/LeaderInfoResponse.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleLeaderInfoScreen extends StatefulWidget {
  SingleLeaderInfoScreen({Key? key, this.item}) : super(key: key);
  static const routeName = "/singleLeaderInfoScreen";
  Result? item;

  @override
  _SingleLeaderInfoScreenState createState() => _SingleLeaderInfoScreenState();
}

class _SingleLeaderInfoScreenState extends State<SingleLeaderInfoScreen> {

  String iconPath = '';

  @override
  void initState() {
    super.initState();

    if(widget.item!.socialLink!.toLowerCase().contains("twitter")){
      iconPath = 'assets/images/twitter.png';
    } else if (widget.item!.socialLink!.toLowerCase().contains("facebook")){
      iconPath = 'assets/images/fb.png';
    } else if (widget.item!.socialLink!.toLowerCase().contains("linkedin")){
      iconPath = 'assets/images/linkedin.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.leader),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                child: Stack(
                  children: [
                    Image.network(ApiUrl.BASEURL + widget.item!.image!,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            widget.item!.name!,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
              //   child: HtmlWidget(
              //       '<b>' + t.branch_name + ':</b> ' + widget.item.branchName),
              // ),
              // Visibility(
              //   visible: widget.item.socialLink.isNotEmpty,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              //     child: Row(
              //       children: [
              //         HtmlWidget('<b>' + t.socail_account + ':</b>'),
              //         SizedBox(width: 10,),
              //         InkWell(child: Image.asset(iconPath, height: 30, width: 30,), onTap: () =>{
              //           _openUrl(widget.item.socialLink)
              //         },),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: HtmlWidget('<b>' +
                    t.leader_desc_json +
                    ':</b>' +
                    widget.item!.description!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // method to open url
  void _openUrl(String _url) async{
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
