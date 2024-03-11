import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PostVideoPlayer extends StatefulWidget {
  PostVideoPlayer({this.videoURL});
  final String? videoURL;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends State<PostVideoPlayer> {
  BetterPlayerController? _betterPlayerController;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  bool isVisible = false;

  @override
  void initState() async{
    videoPlayerController = VideoPlayerController.network(widget.videoURL!);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      allowedScreenSleep: false,
    );
  /*  BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoURL!);
    _betterPlayerController = new BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 3 / 2,
          autoPlay: false,
          allowedScreenSleep: false,
          //showControlsOnInitialize: true,
        ),
        betterPlayerDataSource: betterPlayerDataSource);*/
    super.initState();
  }

  @override
  void dispose() {
    //_betterPlayerController!.pause();
    chewieController!.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(), //Key('my-widget-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = (visibilityInfo.visibleFraction * 100).floor();
        if (!mounted) return;
        if (visiblePercentage < 30 && chewieController != null) {
          // if (!isVisible) return;
         // _betterPlayerController!.pause();
          chewieController!.pause();
          /* setState(() {
            isVisible = false;
          });*/
        }
        /*else {
          if (isVisible) return;
          setState(() {
            isVisible = true;
          });
          if (Provider.of<AppStateManager>(context, listen: false)
                  .autoPlayVideos &&
              _betterPlayerController != null) {
            //_betterPlayerController.play();
          }
        }*/
      },
      child: Container(
          height: 300,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(
              controller: chewieController!,
            ),
          )),
    );
  }
}
