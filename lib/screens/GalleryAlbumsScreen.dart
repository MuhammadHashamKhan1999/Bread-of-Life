import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/GalleryAlbumsResponse.dart';
import 'package:churchapp_flutter/screens/AlbumImagesScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class GalleryAlbumsScreen extends StatefulWidget {
  static const routeName = "/galleryAlbumsScreen";

  @override
  _GalleryAlbumsScreenState createState() => _GalleryAlbumsScreenState();
}

class _GalleryAlbumsScreenState extends State<GalleryAlbumsScreen> {

  Future<GalleryAlbumsResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchAlbumsAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.gallery),
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
                  return GridView.count(
                    padding: EdgeInsets.only(top: 0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 4,
                    children: List.generate(items!.length, (index) {
                      return Column(
                        children: [
                          InkWell(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.black26,
                                    child: Image.network(ApiUrl.BASEURL + items!.elementAt(index).featured!,
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(items!.elementAt(index).title!)
                                ],
                              ),
                            ),
                            onTap: () {
                              _openAlbumImagesScreen(index);
                            },
                          ),
                        ],
                      );
                    },
                    ),
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
      ),
    );
  }

  // open album images screen
  void _openAlbumImagesScreen(int index){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AlbumImagesScreen(id: items![index].id, title: items![index].title, description: items![index].description, img: ApiUrl.BASEURL + items!.elementAt(index).featured!,)));
  }

  // API method
  Future<GalleryAlbumsResponse> _fetchAlbumsAPI() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.ALBUMS), headers: headers);
    final galleryAlbumsResponse = galleryAlbumsResponseFromJson(response.body);
    if (galleryAlbumsResponse.status == 'ok') {
      setState(() {
        items = galleryAlbumsResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return galleryAlbumsResponse;
  }

}