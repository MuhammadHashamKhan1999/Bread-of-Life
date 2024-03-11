import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/AnnouncementsResponse.dart';
import 'package:churchapp_flutter/screens/AnnouncementInfoScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AnnouncementsScreen extends StatefulWidget {
  static const routeName = "/AnnouncementsScreen";

  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {

  Future<AnnouncementsResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchAnnouncementsAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.announcements),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
        child: FutureBuilder(
          future: mResponse,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (mResponse != null && items != null && items!.isNotEmpty) {
                return ListView.builder(
                    controller: new ScrollController(keepScrollOffset: false),
                    itemCount: items!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 85,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                  items!.elementAt(index).title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  items!.elementAt(index).text!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff868282))),
                              trailing: Text(
                                  _convertDate(items!.elementAt(index).sendAt!),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff868282))),
                              onTap: () => {_openAnnouncementsInfoScreen(items![index])},
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Container(
                    child: Text(
                      t.no_data,
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  String _convertDate(String time){
    var input = DateFormat('yyyy-MM-DD hh:mm:ss').parse(time);
    return DateFormat('dd MMM, yyyy').format(input);
  }

  // open album leader info screen
  void _openAnnouncementsInfoScreen(Result item) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => AnnouncementInfoScreen(item: item)));
  }

  // API method
  Future<AnnouncementsResponse> _fetchAnnouncementsAPI() async {
    Map<String, String> headers = {"Content-type": "application/json"};

    Response response = await get(Uri.parse(ApiUrl.GET_ANNOUNCEMENTS), headers: headers);
    final res = announcementsResponseFromJson(response.body);
    if (res.status == '200') {
      setState(() {
        items = res.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return res;
  }
}
