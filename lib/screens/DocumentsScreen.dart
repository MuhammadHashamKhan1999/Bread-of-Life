import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/DocumentsResponse.dart';
import 'package:churchapp_flutter/screens/DocumentInfoScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DocumentsScreen extends StatefulWidget {
  static const routeName = "/documentsScreen";
  DocumentsScreen({Key? key, this.id, this.title}) : super(key: key);

  String? id = '', title = '';

  @override
  _DocumentsScreenState createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {

  Future<DocumentsResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchDocumentsAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
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
                            height: 70,
                            child: Center(
                              child: ListTile(
                                title: Text(
                                    items!.elementAt(index).foldersFileTitle!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  items!.elementAt(index).folderDescription!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2),
                                onTap: () => {_openDocumentInfoScreen(items![index])},
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

  // open screen
  void _openDocumentInfoScreen(Result item){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DocumentInfoScreen(item: item)));
  }

  // API method
  Future<DocumentsResponse> _fetchDocumentsAPI() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.GET_DOCUMENTS + widget.id!), headers: headers);
    final documentsResponse = documentsResponseFromJson(response.body);
    if (documentsResponse.status == 'ok') {
      setState(() {
        items = documentsResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return documentsResponse;
  }

}