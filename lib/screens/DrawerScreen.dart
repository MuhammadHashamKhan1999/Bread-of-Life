import 'package:churchapp_flutter/screens/AnnouncementsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Userdata.dart';
import 'package:flutter/cupertino.dart';
import '../providers/AppStateManager.dart';
import '../screens/PlaylistsScreen.dart';
import '../screens/BookmarkScreen.dart';
import '../socials/UpdateUserProfile.dart';
import '../socials/SocialActivity.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import '../utils/TextStyles.dart';
import '../utils/app_themes.dart';
import '../utils/langs.dart';
import '../utils/my_colors.dart';
import '../utils/ApiUrl.dart';
import 'package:launch_review/launch_review.dart';
import '../auth/LoginScreen.dart';
import '../i18n/strings.g.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late AppStateManager appManager;

  Future<void> showLogoutAlert() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text(t.logoutfromapp),
              content: new Text(t.logoutfromapphint),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    appManager.unsetUserData();
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  openBrowserTab(String title, String url) async {
    await FlutterWebBrowser.openWebPage(
        url: url,);
  }

  @override
  Widget build(BuildContext context) {
    appManager = Provider.of<AppStateManager>(context);
    Userdata? userdata = appManager.userdata;
    bool themeSwitch = appManager.themeData == appThemeData[AppTheme.Dark];
    String? language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]!
            ['name'];

    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25,),
          Stack(
            children: [
              (userdata != null && userdata.coverPhoto != "")
                  ? Container(
                      width: double.infinity,
                      // height: 160,
                      // color: MyColors.primary,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(userdata.coverPhoto!),
                            fit: BoxFit.fill),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      // height: 160,
                      // color: MyColors.primary,
                    ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                // color:
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (userdata != null && userdata.avatar != "")
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: NetworkImage(userdata.avatar!),
                                  fit: BoxFit.fill),
                            ),
                          )
                        : Icon(
                          Icons.account_box,
                          color: Color(0xffFFF6B23F),
                          size: 40,
                        ),
                    Container(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userdata == null ? t.guestuser : userdata.name!, style: TextStyles.title(context).copyWith(fontSize: 20,color: Colors.white70)),
                        SizedBox(height: 3,),
                        Text(userdata == null ? t.guestemail : userdata.email!, style: TextStyles.title(context).copyWith(fontSize: 18,color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Divider(height: 1,thickness: .5,color: Colors.white54,),
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PlaylistsScreen.routeName);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.playlist_play,
                            size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.myplaylists,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                              color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, BookmarksScreen.routeName);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.collections_bookmark,
                            size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.bookmarks,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20, color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 20),
                InkWell(
                  onTap: () {
                    if (userdata == null) {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    } else if (userdata.activated == 1) {
                      showDialog(
                        context: context,
                        builder: (context) => new CupertinoAlertDialog(
                          title: new Text(t.updateprofile),
                          content: new Text(t.updateprofilehint),
                          actions: <Widget>[
                             MaterialButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: new Text(t.cancel),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushNamed(
                                    context, UpdateUserProfile.routeName);
                              },
                              child: new Text(t.ok),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, SocialActivity.routeName);
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.group, size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        SizedBox(
                          width: 180,
                          child: Text(t.gosocial,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 20, color: Colors.white70
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AnnouncementsScreen.routeName);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.announcement, size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        SizedBox(
                          width: 180,
                          child: Text(t.announcements,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 20, color: Colors.white70
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 20),
                Divider(height: 1, color: Colors.white54, thickness: .5,),
                Container(height: 8),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: SizedBox(
                                width: 180, child: Text(t.chooseapplanguage)),
                            content: Container(
                              height: 250.0,
                              width: 400.0,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: appLanguageData.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  var selected = appLanguageData[AppLanguage
                                          .values[index]]!['name'] ==
                                      language;
                                  return ListTile(
                                    trailing: selected
                                        ? Icon(Icons.check)
                                        : Container(
                                            height: 0,
                                            width: 0,
                                          ),
                                    title: Text(
                                      appLanguageData[
                                          AppLanguage.values[index]]!['name']!,
                                    ),
                                    onTap: () {
                                      appManager.setAppLanguage(index);
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.language, size: 30.0,color: Colors.white70),
                        Container(width: 10),
                        Text(t.selectlanguage,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 0),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.color_lens, size: 30.0,color: Colors.white70),
                        Container(width: 10),
                        Text(t.nightmode,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                        Spacer(),
                        Switch(
                          value: themeSwitch,
                          onChanged: (value) {
                            appManager.setTheme(
                                value ? AppTheme.Dark : AppTheme.White);
                          },
                          activeColor: MyColors.primary,
                          inactiveThumbColor: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(height: 0),
                Visibility(
                  visible: false,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.video_library, size: 20.0),
                          Container(width: 10),
                          SizedBox(
                            width: 180,
                            child: Text(t.autoplayvideos,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                          ),
                          Spacer(),
                          Switch(
                            value: appManager.autoPlayVideos,
                            onChanged: (value) {
                              appManager.setAutoPlayVideos(value);
                            },
                            activeColor: MyColors.primary,
                            inactiveThumbColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 20),
                Divider(height: 1, color: Colors.white54, thickness: .5,),
                Container(height: 20),
                InkWell(
                  onTap: () {
                    LaunchReview.launch();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.rate_review,
                            size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.rate,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {
                    openBrowserTab(t.about, ApiUrl.ABOUT);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info, size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.about,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {
                    openBrowserTab(t.terms, ApiUrl.TERMS);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chrome_reader_mode,
                            size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.terms,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                InkWell(
                  onTap: () {
                    openBrowserTab(t.privacy, ApiUrl.PRIVACY);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.label_important,
                            size: 30.0, color: Colors.white70),
                        Container(width: 15),
                        Text(t.privacy,
                            style: TextStyles.subhead(context).copyWith(
                              fontSize: 20,
                                color: Colors.white70
                            )),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
              ],
            ),
          ),
          Spacer(),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Container(
                  width: 200,
                  height: 45,
                  child: MaterialButton(
                    child: Text(
                      userdata != null ? t.logout : t.login,
                      style: TextStyle(color: MyColors.primary,fontSize: 20),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20)),
                    onPressed: () {
                      if (userdata != null) {
                        showLogoutAlert();
                      } else {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
