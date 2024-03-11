import 'package:churchapp_flutter/models/http/responses/EventsResponse.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class EventDetailScreen extends StatefulWidget {
  EventDetailScreen({Key? key, this.mEvent}) : super(key: key);
  static const routeName = "/eventDetailScreen";
  Result? mEvent;

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mEvent!.title!),
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
            children: [
              Image.network(ApiUrl.EVENTS_THUMBNAIL + widget.mEvent!.thumbnail!, fit: BoxFit.fill, height: 220, width: MediaQuery.of(context).size.width),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                child: HtmlWidget(widget.mEvent!.details!),
              ),
            ],
          ),
        ),
      ),
    );
  }

}