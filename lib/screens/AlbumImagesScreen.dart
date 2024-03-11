import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/AlbumImagesResponse.dart';
import 'package:churchapp_flutter/screens/ImagePreviewScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class AlbumImagesScreen extends StatefulWidget {
  AlbumImagesScreen({Key? key, this.id, this.title, this.img, this.description}) : super(key: key);
  static const routeName = "/albumImagesScreen";
  String? id, title, img, description;

  @override
  _AlbumImagesScreenState createState() => _AlbumImagesScreenState();
}

class _AlbumImagesScreenState extends State<AlbumImagesScreen> {

  Future<AlbumImagesResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchAlbumImagesAPI();
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
        child: FutureBuilder(
          future: mResponse,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (mResponse != null && items != null && items!.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(widget.img!, fit: BoxFit.fill, height: 220, width: MediaQuery.of(context).size.width),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Text(widget.description!),
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GridView.count(
                          padding: EdgeInsets.only(top: 0),
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 4,
                          children: List.generate(items!.length, (index) {
                            return InkWell(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  color: Colors.black26,
                                  child: Image.network(ApiUrl.BASEURL + items!.elementAt(index).image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                _openImagePreviewScreen(index);
                              },
                            );
                          },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
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

  // open album images screen
  void _openImagePreviewScreen(int index){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ImagePreviewScreen(img: ApiUrl.BASEURL + items![index].image!,)));
  }

  // API method
  Future<AlbumImagesResponse> _fetchAlbumImagesAPI() async {
    var url = ApiUrl.ALBUMS_IMAGES + widget.id!;

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(url), headers: headers);
    final albumImagesResponse = albumImagesResponseFromJson(response.body);
    if (albumImagesResponse.status == 'ok') {
      setState(() {
        items = albumImagesResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return albumImagesResponse;
  }

}