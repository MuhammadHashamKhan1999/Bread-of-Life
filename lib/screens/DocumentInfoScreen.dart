import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:churchapp_flutter/models/http/responses/DocumentsResponse.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DocumentInfoScreen extends StatefulWidget {
  DocumentInfoScreen({Key? key, this.item}) : super(key: key);
  static const routeName = "/documentInfoScreen";
  Result? item;

  @override
  _DocumentInfoScreenState createState() => _DocumentInfoScreenState();
}

class _DocumentInfoScreenState extends State<DocumentInfoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item!.foldersFileTitle!),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
              child: HtmlWidget('<b>' + t.description + ':</b> ' + (widget.item!.folderDescription != null ? widget.item!.folderDescription! : "")),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () => _loadUrl(ApiUrl.BASEURL + widget.item!.foldersFilePath!),
      ),
    );
  }

  // load url
  void _loadUrl(String _url) async {
    print(_url);
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}