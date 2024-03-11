import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/ContactUsScreen.dart';
import 'package:churchapp_flutter/screens/DocumentFoldersScreen.dart';
import 'package:churchapp_flutter/screens/EventsScreen.dart';
import 'package:churchapp_flutter/screens/GalleryAlbumsScreen.dart';
import 'package:churchapp_flutter/screens/LeadersScreen.dart';
import 'package:churchapp_flutter/screens/MinistriesScreen.dart';
import 'package:churchapp_flutter/screens/PrayerRequestScreen.dart';
import 'package:churchapp_flutter/screens/donation.dart';
import '../screens/BibleScreen.dart';
import '../providers/AudioPlayerModel.dart';
import '../audio_player/miniPlayer.dart';
import '../models/ScreenArguements.dart';
import '../models/Userdata.dart';
import '../screens/BranchesScreen.dart';
import '../livetvplayer/LivestreamsPlayer.dart';
import '../screens/EventsListScreen.dart';
import '../screens/InboxListScreen.dart';
import '../screens/HymnsListScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/CategoriesScreen.dart';
import '../screens/DevotionalScreen.dart';
import '../screens/VideoScreen.dart';
import '../screens/AudioScreen.dart';
import '../screens/NotesListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/HomeProvider.dart';
import '../utils/img.dart';
import '../models/Media.dart';
import '../models/Radios.dart';
import '../i18n/strings.g.dart';
import '../utils/TextStyles.dart';
import '../screens/HomeSlider.dart';
import '../screens/NoitemScreen.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/ApiUrl.dart';

enum HomeIndex {
  CATEGORIES,
  VIDEOS,
  AUDIOS,
  BIBLEBOOKS,
  LIVESTREAMS,
  RADIO,
  EVENTS,
  CONTACT_US,
  DEVOUTIONALS,
  GALLERY,
  LEADERS,
  MINISTRIES,
  DOCUMENTS
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.userdata}) : super(key: key);
  final Userdata? userdata;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeProvider? homeProvider;

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Appbar(),
            Expanded(
              child: HomePageBody(
                homeProvider: homeProvider,
                key: UniqueKey(),
              ),
            ),
            MiniPlayer(),
          ],
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
    required this.homeProvider,
  }) : super(key: key);

  final HomeProvider? homeProvider;

  onRetryClick() {
    homeProvider!.loadItems();
  }

  openBrowserTab(String url) async {
    await FlutterWebBrowser.openWebPage(
        url: url);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppStateManager>(context);
    if (homeProvider!.isLoading) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: true,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 12,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (homeProvider!.isError) {
      return NoitemScreen(
          title: t.oops, message: t.dataloaderror, onClick: onRetryClick);
    } else
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 5),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            //     child: Text(
            //       t.suggestedforyou,
            //       style: TextStyles.headline(context).copyWith(
            //         fontWeight: FontWeight.bold,
            //         fontFamily: "serif",
            //         fontSize: 17,
            //       ),
            //     ),
            //   ),
            // ),
            HomeSlider(homeProvider!.data['sliders'] as List<Media>?),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0.00,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.lightGreen[500],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),
                                      Icon(
                                        Icons.camera,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        t.website,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => openBrowserTab(homeProvider!.data['website'] as String),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.orange[300],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),
                                      Icon(
                                        Icons.location_city,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        t.branches, //Partners
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).pushNamed(BranchesScreen.routeName),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.purple[400],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.library_books,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        t.hymns,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).pushNamed(HymnsListScreen.routeName),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.blue[400],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width:5),
                                      Icon(
                                        Icons.event,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width:20),
                                      Text(
                                        t.events,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).pushNamed(EventsListScreen.routeName),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.indigo[300],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.email,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        t.inbox,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).pushNamed(InboxListScreenState.routeName),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.lightGreen[400],
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.book,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        t.notes,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () =>   Navigator.of(context).pushNamed(NotesListScreen.routeName),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.yellow[600],
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10, right: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        t.donate,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () =>  Navigator.of(context).push(
                                CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => Donation(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              child: Container(
                                color: Colors.cyan[600],
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_pray.png",
                                        height: 30,
                                        width: 30,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        t.prayer_request,
                                        style: TextStyle(fontFamily: 'WorkSans', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () =>  Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) => PrayerRequestScreen(homeProvider!.data['prayer_text'].toString()) )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.CATEGORIES,
                    homeProvider: homeProvider,
                    title: t.categories,
                    thumbnail: homeProvider!.data['more'] as String,
                    useAssetsImage: homeProvider!.data['more'] == "",
                    assetsImage: "assets/images/messages.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.VIDEOS,
                    homeProvider: homeProvider,
                    title: t.videos,
                    thumbnail: homeProvider!.data['image2'] as String,
                    useAssetsImage: homeProvider!.data['image2'] == "",
                    assetsImage: "assets/images/messages.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.AUDIOS,
                    homeProvider: homeProvider,
                    title: t.audios,
                    thumbnail: homeProvider!.data['image2'] as String,
                    useAssetsImage: homeProvider!.data['image2'] == "",
                    assetsImage: "assets/images/sermons.jpg",
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.BIBLEBOOKS,
                    homeProvider: homeProvider,
                    title: t.biblebooks,
                    thumbnail: homeProvider!.data['image3'] as String,
                    useAssetsImage: homeProvider!.data['image3'] == "",
                    assetsImage: "assets/images/bible.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.LIVESTREAMS,
                    homeProvider: homeProvider,
                    title: t.livestreams,
                    thumbnail: homeProvider!.data['image4'] as String,
                    useAssetsImage: homeProvider!.data['image4'] == "",
                    assetsImage: "assets/images/livestream.jpg",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.RADIO,
                    homeProvider: homeProvider,
                    title: t.radio,
                    thumbnail: homeProvider!.data['image5'] as String,
                    useAssetsImage: homeProvider!.data['image5'] == "",
                    assetsImage: "assets/images/radio.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.EVENTS,
                    homeProvider: homeProvider,
                    title: t.events,
                    thumbnail: homeProvider!.data['events'] as String,
                    useAssetsImage: homeProvider!.data['events'] == "",
                    assetsImage: "assets/images/events.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.LEADERS,
                    homeProvider: homeProvider,
                    title: t.leaders,
                    thumbnail: homeProvider!.data['image4'] as String,
                    useAssetsImage: homeProvider!.data['image4'] == "",
                    assetsImage: "assets/images/leader.jpg",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.MINISTRIES,
                    homeProvider: homeProvider,
                    title: t.ministries,
                    thumbnail: homeProvider!.data['ministry'] as String,
                    useAssetsImage: homeProvider!.data['ministry'] == "",
                    assetsImage: "assets/images/ministry.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.GALLERY,
                    homeProvider: homeProvider,
                    title: t.photos,
                    thumbnail: homeProvider!.data['gallery'] as String,
                    useAssetsImage: homeProvider!.data['gallery'] == "",
                    assetsImage: "assets/images/gallery.jpg",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.DEVOUTIONALS,
                    homeProvider: homeProvider,
                    title: t.devotionals,
                    thumbnail: homeProvider!.data['image6'] as String,
                    useAssetsImage: homeProvider!.data['image6'] == "",
                    assetsImage: "assets/images/devolutional.jpg",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.DOCUMENTS,
                    homeProvider: homeProvider,
                    title: t.documents,
                    thumbnail: homeProvider!.data['document'] as String,
                    useAssetsImage: homeProvider!.data['document'] == "",
                    assetsImage: "assets/images/document.png",
                  ),
                ),
                Expanded(
                  child: ItemTile(
                    index: HomeIndex.CONTACT_US,
                    homeProvider: homeProvider,
                    title: t.contact_us,
                    thumbnail: homeProvider!.data['contact_us'] as String,
                    useAssetsImage: homeProvider!.data['contact_us'] == "",
                    assetsImage: "assets/images/contact_us.jpg",
                  ),
                ),
              ],
            ),
            Container(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Text(
                  "Follow us on",
                  style: TextStyles.headline(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              //color: Colors.white,
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        openBrowserTab(homeProvider!.data['facebook_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_facebook.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(width: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(homeProvider!.data['youtube_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_youtube.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(width: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(homeProvider!.data['twitter_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_twitter.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(width: 10),
                    InkWell(
                      onTap: () {
                        openBrowserTab(homeProvider!.data['instagram_page'] as String);
                      },
                      child: Container(
                        child: Image.asset(Img.get('img_social_instagram.png')),
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 15),
          ],
        ),
      );
  }
}

class ItemTile extends StatelessWidget {
  final String title;
  final String thumbnail;
  final bool useAssetsImage;
  final String assetsImage;
  final HomeIndex index;
  final HomeProvider? homeProvider;

  const ItemTile(
      {Key? key,
        required this.index,
        required this.title,
        required this.thumbnail,
        required this.homeProvider,
        required this.useAssetsImage,
        required this.assetsImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0, left: 3.00),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: 110,
                //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: thumbnail,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          //colorFilter: ColorFilter.mode(
                          //  Colors.black12, BlendMode.darken),
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Image.asset(
                          assetsImage,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                          //color: Colors.black26,
                        )),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white54,
                    height: 32,
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TextStyles.caption(context).copyWith(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: "serif",
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          switch (index) {
            case HomeIndex.CATEGORIES:
              Navigator.of(context).pushNamed(CategoriesScreen.routeName);
              break;
            case HomeIndex.VIDEOS:
              Navigator.of(context).pushNamed(VideoScreen.routeName);
              break;
            case HomeIndex.AUDIOS:
              Navigator.of(context).pushNamed(AudioScreen.routeName);
              break;
            case HomeIndex.BIBLEBOOKS:
              Navigator.of(context).pushNamed(BibleScreen.routeName);
              break;
            case HomeIndex.LIVESTREAMS:
              Navigator.of(context).pushNamed(LivestreamsPlayer.routeName,
                  arguments: ScreenArguements(
                    position: 0,
                    items: homeProvider!.data['livestream'],
                    itemsList: [],
                  ));
              break;
            case HomeIndex.RADIO:
              Radios radios = homeProvider!.data['radios'] as Radios;
              Media media = new Media(
                  id: radios.id,
                  title: radios.title,
                  coverPhoto: radios.coverPhoto,
                  streamUrl: radios.streamUrl);
              Provider.of<AudioPlayerModel>(context, listen: false).prepareradioplayer(media);
              //Navigator.of(context).pushNamed(RadioPlayer.routeName);
              break;
            case HomeIndex.EVENTS:
              Navigator.of(context).pushNamed(EventsScreen.routeName);
              break;
            case HomeIndex.CONTACT_US:
              Navigator.of(context).pushNamed(ContactUsScreen.routeName);
              break;
            case HomeIndex.GALLERY:
              Navigator.of(context).pushNamed(GalleryAlbumsScreen.routeName);
              break;
            case HomeIndex.LEADERS:
              Navigator.of(context).pushNamed(LeadersScreen.routeName);
              break;
            case HomeIndex.DOCUMENTS:
              Navigator.of(context).pushNamed(DocumentFoldersScreen.routeName);
              break;
            case HomeIndex.MINISTRIES:
              Navigator.of(context).pushNamed(MinistriesScreen.routeName);
              break;
            case HomeIndex.DEVOUTIONALS:
              Navigator.of(context).pushNamed(DevotionalScreen.routeName);
              break;
          }
        },
      ),
    );
  }
}
