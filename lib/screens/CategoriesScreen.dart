import 'package:churchapp_flutter/models/http/responses/MoreResponse.dart';
import 'package:churchapp_flutter/screens/MoreDetailScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/Categories.dart';
import '../models/ScreenArguements.dart';
import '../providers/CategoriesModel.dart';
import '../screens/NoitemScreen.dart';
import '../screens/CategoriesMediaScreen.dart';
import '../i18n/strings.g.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = "/categories";
  CategoriesScreen();

  @override
  CategoriesScreenRouteState createState() => new CategoriesScreenRouteState();
}

class CategoriesScreenRouteState extends State<CategoriesScreen> {

  Future<MoreResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchMoreAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.categories),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12),
        child: Container(
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
                                    NetworkImage(ApiUrl.BASEURL + items!.elementAt(index).image!),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  title: Text(
                                      items!.elementAt(index).title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  onTap: () => {_openMoreDetailScreen(index)},
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
      ),
    );
  }

  // open more detail screen
  void _openMoreDetailScreen(int index){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MoreDetailScreen(item: items![index],)));
  }

  // API method
  Future<MoreResponse> _fetchMoreAPI() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.GET_MORE_SERVICES), headers: headers);
    final moreResponse = moreResponseFromJson(response.body);
    if (moreResponse.status == 'ok') {
      setState(() {
        items = moreResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return moreResponse;
  }

}

class CategoriesPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoriesModel categoriesModel = Provider.of<CategoriesModel>(context);
    List<Categories>? items = categoriesModel.categories;
    if (categoriesModel.isLoading) {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else if (categoriesModel.isError) {
      return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            categoriesModel.loadItems();
          });
    } else
      return GridView.builder(
        itemCount: categoriesModel.categories!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return ItemTile(
            index: index,
            categories: items![index],
          );
        },
      );
  }
}

class ItemTile extends StatelessWidget {
  final Categories categories;
  final int index;

  const ItemTile({
    Key? key,
    required this.index,
    required this.categories,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: InkWell(
        child: Container(
          height: 200.0,
          width: 120.0,
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: categories.thumbnailUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  categories.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  categories.mediaCount.toString() + " " + t.messages,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            CategoriesMediaScreen.routeName,
            arguments: ScreenArguements(position: 0, items: categories),
          );
        },
      ),
    );
  }
}
