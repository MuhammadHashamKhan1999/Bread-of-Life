import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import '../models/LiveStreams.dart';
import 'package:flutter/cupertino.dart';
import '../providers/AppStateManager.dart';
import 'LiveYoutubePlayer.dart';

class LivestreamsPlayer extends StatefulWidget {
  static String routeName = "/livestreamsplayer";
  final LiveStreams? liveStreams;

  LivestreamsPlayer({Key? key, this.liveStreams}) : super(key: key);

  @override
  _VideoViewerScreenState createState() => _VideoViewerScreenState();
}

class _VideoViewerScreenState extends State<LivestreamsPlayer> {
  BetterPlayerController? _betterPlayerController;
  LiveStreams? currentMedia;
  /*Future<BetterPlayerController?>? reloadController;*/
  Future<ChewieController?>? reloadController;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  late VlcPlayerController _controller;

  @override
  void initState() {
    currentMedia = widget.liveStreams;
    if (currentMedia!.type == 'rtmp') {
      _controller = VlcPlayerController.network(
        currentMedia!.streamUrl!,
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions(),
      );
    } else {
      reloadController = playVideoStream();
    }
    super.initState();
  }


  Future<ChewieController?> playVideoStream() async {
    videoPlayerController =
        VideoPlayerController.network(currentMedia!.streamUrl!);
    await videoPlayerController.initialize();
    chewieController = ChewieController(


        videoPlayerController: videoPlayerController,
        autoPlay:true,
        placeholder: CachedNetworkImage(
          imageUrl: "https://www.technocrazed.com/wp-content/uploads/2015/12/Landscape-wallpaper-36.jpg",
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
          errorWidget: (context, url, error) =>
              Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.grey,
                  )),
        ),
        aspectRatio: 3 / 2);

    return chewieController;
  }



 /* Future<BetterPlayerController?> playVideoStream() async {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, currentMedia!.streamUrl!);
    _betterPlayerController = new BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 3 / 2,
          placeholder: CachedNetworkImage(
            imageUrl:
                "https://www.technocrazed.com/wp-content/uploads/2015/12/Landscape-wallpaper-36.jpg",
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
          autoPlay: true,
          allowedScreenSleep: false,
          //showControlsOnInitialize: true,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
    // _betterPlayerController.addEventsListener((event) {
    //print("Better player event: ${event.betterPlayerEventType}");
    // });
    return _betterPlayerController;
  }*/

  @override
  void dispose() async {
    super.dispose();

    if (currentMedia!.type == 'rtmp') {
      await _controller.stopRendererScanning();
      await _controller.dispose();
    }
  }

  Widget _buildWidgetAlbumCoverBlur() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(
              "https://www.technocrazed.com/wp-content/uploads/2015/12/Landscape-wallpaper-36.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.liveStreams!.title!),
      ),
      body: Stack(
        children: <Widget>[
          _buildWidgetAlbumCoverBlur(),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5)
              ],
            )),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: buildVideoContainer(currentMedia!),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildVideoContainer(LiveStreams currentMedia) {
    if (currentMedia.type == "rtmp") {
      return FutureBuilder<ChewieController?>(
        future: reloadController,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: snapshot.data!,
              ),
            );
          }
        },
      );
    } else if (currentMedia.type == "m3u8") {
      return FutureBuilder<ChewieController?>(
        future: reloadController,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: snapshot.data!,
              ),
            );
          }
        },
      );
    } if (currentMedia.type == "youtube") {
      return LiveYoutubePlayer(media: currentMedia, key: UniqueKey());
    } else {
      return Container();
    }
  }
}
