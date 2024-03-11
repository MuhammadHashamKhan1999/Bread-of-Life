import 'package:churchapp_flutter/models/http/responses/MoreResponse.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class MoreDetailScreen extends StatefulWidget {
  MoreDetailScreen({Key? key, this.item}) : super(key: key);
  static const routeName = "/moreDetailScreen";
  Result? item;

  @override
  _MoreDetailScreenState createState() => _MoreDetailScreenState();
}

class _MoreDetailScreenState extends State<MoreDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item!.title!),
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
              Image.network(ApiUrl.BASEURL + widget.item!.image!, fit: BoxFit.cover, height: 220, width: MediaQuery.of(context).size.width,),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item!.heading!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 10,),
                    HtmlWidget(widget.item!.description!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}