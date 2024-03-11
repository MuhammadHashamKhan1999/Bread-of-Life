import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/EventsResponse.dart';
import 'package:churchapp_flutter/screens/EventDetailScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EventsScreen extends StatefulWidget {
  static const routeName = "/eventsScreen";

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  Future<EventsResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchEventsAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.events),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
          const EdgeInsets.only(top: 35.0, left: 20, right: 20),
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
                                 NetworkImage(ApiUrl.EVENTS_THUMBNAIL + items!.elementAt(index).thumbnail!),
                                 backgroundColor: Colors.transparent,
                               ),
                               title: Text(
                                   items!.elementAt(index).title!,
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 1,
                                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                               subtitle: Text(
                                   "Date: " + items!.elementAt(index).date! + " " + items!.elementAt(index).time!,
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 1,
                                   style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                               onTap: () => {_openEventDetailScreen(index)},
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
      ),
    );
  }

  // open events detail screen
  void _openEventDetailScreen(int index){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EventDetailScreen(mEvent: items![index],)));
  }

  // API method
  Future<EventsResponse> _fetchEventsAPI() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.GET_EVENTS), headers: headers);
    print(response.body);
    final eventsResponse = eventsResponseFromJson(response.body);
    if (eventsResponse.status == 'ok') {
      setState(() {
        items = eventsResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return eventsResponse;
  }

}