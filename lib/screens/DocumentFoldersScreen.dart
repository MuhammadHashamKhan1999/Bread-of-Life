import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/DocumentFoldersResponse.dart';
import 'package:churchapp_flutter/screens/DocumentsScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DocumentFoldersScreen extends StatefulWidget {
  static const routeName = "/documentFoldersScreen";
  DocumentFoldersScreen({Key? key}) : super(key: key);

  @override
  _DocumentFoldersScreenState createState() => _DocumentFoldersScreenState();
}

class _DocumentFoldersScreenState extends State<DocumentFoldersScreen> {

  Future<DocumentFoldersResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchDocumentFoldersAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.documents),
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
                                    items!.elementAt(index).title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  items!.elementAt(index).description!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2),
                                onTap: () => {_openDocumentsScreen(items![index])},
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
  void _openDocumentsScreen(Result item){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DocumentsScreen(id: item.id, title: item.title,)));
  }

  // API method
  Future<DocumentFoldersResponse> _fetchDocumentFoldersAPI() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.GET_DOCUMENT_FOLDERS), headers: headers);
    final documentFoldersResponse = documentFoldersResponseFromJson(response.body);
    if (documentFoldersResponse.status == 'ok') {
      setState(() {
        items = documentFoldersResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return documentFoldersResponse;
  }

}