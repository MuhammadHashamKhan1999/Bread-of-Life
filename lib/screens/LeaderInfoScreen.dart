import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/LeaderInfoResponse.dart';
import 'package:churchapp_flutter/screens/SingleLeaderInfoScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class LeaderInfoScreen extends StatefulWidget {
  LeaderInfoScreen({Key? key,this.id}) : super(key: key);
  static const routeName = "/leaderInfoScreen";
  String? id = '';

  @override
  _LeaderInfoScreenState createState() => _LeaderInfoScreenState();
}

class _LeaderInfoScreenState extends State<LeaderInfoScreen> {

  int _current = 0;

  Future<LeaderInfoResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchLeaderInfoAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.leader_info),
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
                    controller:
                    new ScrollController(keepScrollOffset: false),
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
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                NetworkImage(ApiUrl.BASEURL + items!.elementAt(index).image!),
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(
                                  items!.elementAt(index).name!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                              onTap: () => {_openLeaderInfoScreen(items![index])},
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
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // open album single leader info screen
  void _openLeaderInfoScreen(Result item){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SingleLeaderInfoScreen(item: item)));
  }

  // API method
  Future<LeaderInfoResponse> _fetchLeaderInfoAPI() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.LEADER_INFO + widget.id!), headers: headers);
    final leaderInfoResponse = leaderInfoResponseFromJson(response.body);
    if (leaderInfoResponse.status == 'ok') {
      setState(() {
        items = leaderInfoResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return leaderInfoResponse;
  }

}