import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Media.dart';
import '../video_player/VideoPlayer.dart';
import '../models/ScreenArguements.dart';
import '../providers/AudioPlayerModel.dart';
import '../audio_player/player_page.dart';
import '../utils/Utility.dart';

class HomeSlider extends StatelessWidget {
  final List<Media>? items;
  HomeSlider(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10),
          height: 220.0,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
              options: CarouselOptions(
                height: 220,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                autoPlay: true
            ),
            items: items!.map((curObj) => Container(
              color: Colors.grey[100],
              width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        child: Stack(
                          children: [
                            Image.network(
                              curObj.coverPhoto!,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                            // Positioned.fill(
                            //   child: Align(
                            //     alignment: Alignment.bottomCenter,
                            //     child: Container(
                            //       color: Colors.black26,
                            //       height: 45,
                            //       alignment: Alignment.center,
                            //       child: Text(
                            //         curObj.title,
                            //         style: TextStyles.caption(context).copyWith(
                            //           fontSize: 18.0,
                            //           fontWeight: FontWeight.bold,
                            //           color: Colors.white,
                            //           fontFamily: "serif",
                            //         ),
                            //         maxLines: 1,
                            //         textAlign: TextAlign.left,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        onTap: (){
                          if (curObj.mediaType!.toLowerCase() == "audio") {
                            Provider.of<AudioPlayerModel>(context, listen: false)
                                .preparePlaylist(
                                Utility.extractMediaByType(
                                    Utility.extractMediaByType(
                                        items!, curObj.mediaType),
                                    curObj.mediaType),
                                curObj);
                            Navigator.of(context).pushNamed(PlayPage.routeName);
                          } else {
                            Navigator.pushNamed(context, VideoPlayer.routeName,
                                arguments: ScreenArguements(
                                  position: 0,
                                  items: curObj,
                                  itemsList: Utility.extractMediaByType(
                                      items!, curObj.mediaType),
                                ));
                          }
                        },
                      ),
                    ))
                .toList(),
          )
          /*ListView.builder(
            scrollDirection: Axis.horizontal,
            primary: false,
            itemCount:
                (items == null || items.length == 0) ? 0.0 : items.length,
            itemBuilder: (BuildContext context, int index) {
              Media curObj = items[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  child: Container(
                    height: 130.0,
                    width: 120.0,
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 130.0,
                            width: 120.0,
                            child: CachedNetworkImage(
                              imageUrl: curObj.coverPhoto,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                            curObj.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    if (curObj.mediaType.toLowerCase() == "audio") {
                      Provider.of<AudioPlayerModel>(context, listen: false)
                          .preparePlaylist(
                              Utility.extractMediaByType(
                                  Utility.extractMediaByType(
                                      items, curObj.mediaType),
                                  curObj.mediaType),
                              curObj);
                      Navigator.of(context).pushNamed(PlayPage.routeName);
                    } else {
                      Navigator.pushNamed(context, VideoPlayer.routeName,
                          arguments: ScreenArguements(
                            position: 0,
                            items: curObj,
                            itemsList: Utility.extractMediaByType(
                                items, curObj.mediaType),
                          ));
                    }
                  },
                ),
              );
            },
          )*/,
        ),
      ],
    );
  }
}
