import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/AnnouncementsResponse.dart';

import 'package:flutter/material.dart';

class AnnouncementInfoScreen extends StatefulWidget {
  static const routeName = "/AnnouncementInfoScreen";
  AnnouncementInfoScreen({Key? key, this.item}) : super(key: key);

  Result? item;

  @override
  _AnnouncementInfoScreenState createState() => _AnnouncementInfoScreenState();
}

class _AnnouncementInfoScreenState extends State<AnnouncementInfoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.announcement_info),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
          child: ListView(
            children: [
              Text(
                t.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5,),
              Text(
                widget.item!.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff868282),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                t.leader_desc_json,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5,),
              Text(
                widget.item!.text!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff868282),
                ),
              ),
            ],
          ),
        )

        // body: Container(
      //   padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
      //   child: FutureBuilder(
      //     future: mResponse,
      //     builder: (ctx, snapshot) {
      //       if (snapshot.hasData != null &&
      //           snapshot.connectionState == ConnectionState.done) {
      //         if (mResponse != null && items != null && items.isNotEmpty) {
      //           return ListView.builder(
      //               controller: new ScrollController(keepScrollOffset: false),
      //               itemCount: items.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return Card(
      //                   elevation: 6,
      //                   shape: RoundedRectangleBorder(
      //                       side: BorderSide(width: 0.5, color: Colors.white),
      //                       borderRadius: BorderRadius.circular(15)),
      //                   child: Container(
      //                     height: 85,
      //                     child: Center(
      //                       child: ListTile(
      //                         title: Text(
      //                             items.elementAt(index).title,
      //                             overflow: TextOverflow.ellipsis,
      //                             maxLines: 1,
      //                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      //                         subtitle: Text(
      //                             items.elementAt(index).text,
      //                             overflow: TextOverflow.ellipsis,
      //                             maxLines: 1,
      //                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff868282))),
      //                         onTap: () => {_openAnnouncementsInfoScreen(items[index])},
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               });
      //         } else {
      //           return Center(
      //             child: Container(
      //               child: Text(
      //                 t.no_data,
      //                 style: TextStyle(color: Colors.black45, fontSize: 15),
      //               ),
      //             ),
      //           );
      //         }
      //       } else {
      //         return Center(child: CircularProgressIndicator());
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
