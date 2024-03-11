import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../utils/ApiUrl.dart';
import '../models/Branches.dart';
import '../utils/TextStyles.dart';
import 'NoitemScreen.dart';
import '../i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchesScreen extends StatelessWidget {
  static const routeName = "/branches";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.branches),
      ),
      body: Container(
        color: Color(0xffEDEDED),
        padding: EdgeInsets.only(top: 12),
        child: BranchesPageBody(),
      ),
    );
  }
}

class BranchesPageBody extends StatefulWidget {
  @override
  _BranchesPageBodyState createState() => _BranchesPageBodyState();
}

class _BranchesPageBodyState extends State<BranchesPageBody> {
  bool isLoading = true;
  bool isError = false;
  List<Branches>? items = [];

  Future<void> loadItems() async {
    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();
      // Adding an interceptor to enable caching.
      dio.interceptors.add(
        DioCacheManager(
          CacheConfig(baseUrl: ApiUrl.FETCH_BRANCHES),
        ).interceptor,
      );

      final response = await dio.get(
        ApiUrl.FETCH_BRANCHES,
        options: buildCacheOptions(
          Duration(minutes: 0),
          maxStale: Duration(minutes: 0),
          options: (Options(contentType: 'application/json')),
        ),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic res = jsonDecode(response.data);
        print(res);
        List<Branches>? _items = parseBranches(res);
        setState(() {
          isLoading = false;
          items = _items;
        });
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setState(() {
          isLoading = false;
          isError = true;
        });
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  static List<Branches>? parseBranches(dynamic res) {
    // final res = jsonDecode(responseBody);
    final parsed = res["branches"].cast<Map<String, dynamic>>();
    return parsed.map<Branches>((json) => Branches.fromJson(json)).toList();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      loadItems();
    });
    super.initState();
  }

  void sendEmail(String email) async {
    print('triger');
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    launch(_emailLaunchUri.toString());
  }

  void callNumber(String phone) async {
    print('triger');
    final Uri phoneURI = Uri(
      scheme: 'tel',
      path: phone,
    );
    launch(phoneURI.toString());
  }

  void openMap(String address) {
    MapsLauncher.launchQuery(address);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else if (isError) {
      return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            loadItems();
          });
    } else
      return ListView.builder(
        itemCount: items!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(3),
        itemBuilder: (BuildContext context, int index) {
          return ItemTile(
            index: index,
            branches: items![index],
            email: sendEmail,
            mobile: callNumber,
            openMap: openMap,
          );
        },
      );
  }
}

class ItemTile extends StatefulWidget {
  final Branches branches;
  final int index;
  final Function? email;
  final Function? mobile;
  final Function? openMap;
  const ItemTile({
    Key? key,
    required this.index,
    required this.branches,
    this.email,
    this.mobile,
    this.openMap,
  }) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        elevation: 0.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(width: 6),
                  Text(widget.branches.name!,
                      maxLines: 2,
                      style: TextStyle( fontFamily: 'WorkSans', fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              Container(height: 2),
              Row(
                children: <Widget>[
                  Container(width: 6),
                  Text(widget.branches.pastor!,
                      style: TextStyles.subhead(context).copyWith())
                ],
              ),
              Container(height: 10),
              //if (widget.branches.phone != null)
              InkWell(
                onTap: () {
                  widget.mobile!(widget.branches.phone == null
                      ? ''
                      : widget.branches.phone);
                },
                child: Row(
                  children: <Widget>[
                    ClipOval(
                        child: Container(
                      color: Theme.of(context).colorScheme.secondary.withAlpha(30),
                      width: 35.0,
                      height: 35.0,
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        onPressed: () {
                          widget.mobile!(widget.branches.phone == null
                              ? ''
                              : widget.branches.phone);
                        },
                        icon: Icon(
                          Icons.phone,
                          size: 15,
                        ),
                      ),
                    )),
                    Container(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.branches.phone!,
                            style: TextStyles.subhead(context)
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(height: 5),
              //if (widget.branches.email != null)
              InkWell(
                onTap: () {
                  widget.email!(widget.branches.email == null
                      ? ''
                      : widget.branches.email);
                },
                child: Row(
                  children: <Widget>[
                    ClipOval(
                        child: Container(
                      color: Theme.of(context).colorScheme.secondary.withAlpha(30),
                      width: 35.0,
                      height: 35.0,
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        onPressed: () {
                          widget.email!(widget.branches.email == null
                              ? ''
                              : widget.branches.email);
                        },
                        icon: Icon(
                          Icons.email,
                          size: 15,
                        ),
                      ),
                    )),
                    Container(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.branches.email!,
                            style: TextStyles.subhead(context)
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(height: 5),
              //if (widget.branches.address != null)
              InkWell(
                onTap: () {
                  widget.openMap!(widget.branches.address == null
                      ? ''
                      : widget.branches.address);
                },
                child: Row(
                  children: <Widget>[
                    ClipOval(
                        child: Container(
                      color: Theme.of(context).colorScheme.secondary.withAlpha(30),
                      width: 35.0,
                      height: 35.0,
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        onPressed: () {
                          widget.openMap!(widget.branches.address == null
                              ? ''
                              : widget.branches.address);
                        },
                        icon: Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                      ),
                    )),
                    Container(width: 15),
                    Expanded(
                      child: Text(
                        widget.branches.address!,
                        style: TextStyles.subhead(context)
                            .copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
