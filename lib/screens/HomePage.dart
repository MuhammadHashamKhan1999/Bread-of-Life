import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/HomeProvider.dart';
import '../screens/DrawerScreen.dart';
import '../screens/SearchScreen.dart';
import '../models/ScreenArguements.dart';
import '../screens/Downloader.dart';
import 'Home.dart';
import '../utils/my_colors.dart';
import 'package:provider/provider.dart';
import '../i18n/strings.g.dart';
import '../providers/AudioPlayerModel.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = "/homescreen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePageItem();
  }
}

class HomePageItem extends StatefulWidget {
  HomePageItem({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    _updateUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappaudiowarning),
                  actions: <Widget>[
                     MaterialButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                     MaterialButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ) as FutureOr<bool>?)) ??
              false;
        } else {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappwarning),
                  actions: <Widget>[
                     MaterialButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ) as FutureOr<bool>?)) ??
              false;
        }
      },
      child: Container(
        decoration: new  BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                MyColors.primaryDark,
                MyColors.grey,
              ]
          ),
        ),
        child: AdvancedDrawer(
          backdropColor: Colors.transparent,
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60.0,
              leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.arrow_back : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  )),
              title: Text(t.appname),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                      child: Icon(
                        Icons.cloud_download,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Downloader.routeName,
                            arguments: ScreenArguements(
                              position: 0,
                              items: null,
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (() {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      })),
                )
              ],
            ),
            body: ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              child: MyHomePage(),
            ),
          ),
          drawer: SafeArea(child: DrawerScreen()),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }


  // API method
  Future<void> _updateUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("firebase_token");
    try {
      final dio = Dio();
      dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: ApiUrl.sendUserSocialFcmToken)).interceptor,
      );

      final response = await dio.post(
        ApiUrl.sendUserSocialFcmToken,
        data: jsonEncode({"device": Platform.isAndroid ? 'android' : "ios" , "device_id": token}),
        options: buildCacheOptions(
          Duration(days: 0),
          maxStale: Duration(days: 0),
          options: (Options(contentType: 'application/json')),
        ),
      );

      if (response.statusCode == 200) {}
    } catch (exception) {
      print(exception);
    }
  }
}
