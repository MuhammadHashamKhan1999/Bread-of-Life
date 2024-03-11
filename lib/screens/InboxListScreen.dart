import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/InboxViewerScreen.dart';
import '../models/ScreenArguements.dart';
import 'dart:async';
import '../utils/TimUtil.dart';
import '../models/Inbox.dart';
import 'NoitemScreen.dart';
import '../i18n/strings.g.dart';
import '../utils/TextStyles.dart';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart';
import '../utils/ApiUrl.dart';

class InboxListScreenState extends StatelessWidget {
  static const routeName = "/inboxlist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.inbox),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12),
        child: InboxScreenBody(),
      ),
    );
  }
}

class InboxScreenBody extends StatefulWidget {
  @override
  InboxScreenBodyRouteState createState() => new InboxScreenBodyRouteState();
}

class InboxScreenBodyRouteState extends State<InboxScreenBody> {
  List<Inbox>? items = [];
  bool isLoading = false;
  bool isError = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 0;

  void _onRefresh() async {
    loadItems();
  }

  void _onLoading() async {
    loadMoreItems();
  }

  loadItems() {
    refreshController.requestRefresh();
    page = 0;
    setState(() {});
    fetchItems();
  }

  loadMoreItems() {
    page = page + 1;
    fetchItems();
  }

  void setItems(List<Inbox>? item) {
    items!.clear();
    items = item;
    refreshController.refreshCompleted();
    isError = false;
    setState(() {});
  }

  void setMoreItems(List<Inbox> item) {
    refreshController.loadComplete();
    isError = false;
    items!.addAll(item);
    setState(() {});
  }

  Future<void> fetchItems() async {
    try {
      final dio = Dio();
      // Adding an interceptor to enable caching.
      dio.interceptors.add(
        DioCacheManager(
          CacheConfig(baseUrl: ApiUrl.INBOX),
        ).interceptor,
      );

      final response = await dio.post(
        ApiUrl.INBOX,
        data: jsonEncode({
          "data": {"page": page.toString()}
        }),
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
        List<Inbox>? mediaList = parseSliderMedia(res);
        if (page == 0) {
          setItems(mediaList);
        } else {
          setMoreItems(mediaList!);
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setFetchError();
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
      setFetchError();
    }
  }

  static List<Inbox>? parseSliderMedia(dynamic res) {
    final parsed = res["inbox"].cast<Map<String, dynamic>>();
    return parsed.map<Inbox>((json) => Inbox.fromJson(json)).toList();
  }

  setFetchError() {
    if (page == 0) {
      setState(() {
        isError = true;
        refreshController.refreshFailed();
      });
    } else {
      setState(() {
        refreshController.loadFailed();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(t.pulluploadmore);
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(t.loadfailedretry);
          } else if (mode == LoadStatus.canLoading) {
            body = Text(t.releaseloadmore);
          } else {
            body = Text(t.nomoredata);
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: (isError == true && items!.length == 0)
          ? NoitemScreen(
              title: t.oops, message: t.dataloaderror, onClick: _onRefresh)
          : ListView.builder(
              itemCount: items!.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(3),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 5,),
                    ItemTile(
                      object: items![index],
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Inbox object;

  const ItemTile({
    Key? key,
    required this.object,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(InboxViewerScreen.routeName,
            arguments: ScreenArguements(
              position: 0,
              items: object,
              itemsList: [],
            ));
      },
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 80,
                  color: Color(0xffFAF8F8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        TimUtil.formatDatestamp(object.date!).split(",")[0],
                        style: TextStyles.caption(context).copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd5d1d1)),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        TimUtil.formatDatestamp(object.date!).split(",")[1].split(" ")[2],
                        style: TextStyles.caption(context).copyWith(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff979292)),
                      ), SizedBox(height: 2,),
                      Text(
                        TimUtil.formatDatestamp(object.date!).split(",")[1].split(" ")[1],
                        style: TextStyles.caption(context).copyWith(fontSize: 19, fontWeight: FontWeight.bold, color: Color(0xff979292)),
                      ), SizedBox(height: 2,),
                      Text(
                        TimUtil.formatDatestamp(object.date!).split(",")[2],
                        style: TextStyles.caption(context).copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffd5d1d1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          object.title!,
                          maxLines: 2,
                          style: TextStyles.subhead(context)
                              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5,),
                        Text(TimUtil.formatTimestamp(object.date!),
                            style: TextStyles.caption(context).copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
                // Column(
                //   children: <Widget>[
                //     Expanded(
                //       child: Row(
                //         children: <Widget>[
                //           Expanded(
                //             child: Column(
                //               children: <Widget>[
                //                 Row(
                //                   children: <Widget>[
                //                     Text(
                //                       TimUtil.formatDatestamp(object.date),
                //                       style: TextStyles.caption(context)
                //                           .copyWith(fontSize: 15),
                //                     ),
                //                     Spacer(),
                //                     Text(TimUtil.formatTimestamp(object.date),
                //                         style: TextStyles.caption(context)
                //                         //.copyWith(color: MyColors.grey_60),
                //                         ),
                //                   ],
                //                 ),
                //                 Spacer(
                //                   flex: 1,
                //                 ),
                //                 Align(
                //                   alignment: Alignment.centerLeft,
                //                   child: Text(object.title,
                //                       maxLines: 2,
                //                       style: TextStyles.subhead(context).copyWith(
                //                           fontSize: 16, fontWeight: FontWeight.w500)),
                //                 ),
                //                 Spacer(),
                //                 Row(
                //                   children: <Widget>[
                //                     Text("", style: TextStyles.caption(context)
                //                         //.copyWith(color: MyColors.grey_60),
                //                         ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     Container(
                //       height: 10,
                //     ),
                //     Divider(
                //       height: 0.1,
                //       //color: Colors.grey.shade800,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          Container(color: Color(0xFFF6F6F6), height: 1,width: double.infinity,)
        ],
      ),
    );
  }
}
