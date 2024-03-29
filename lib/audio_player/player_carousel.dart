import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/TimUtil.dart';
import '../providers/AudioPlayerModel.dart';
import '../providers/MediaPlayerModel.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Column(
      children: _controllers(context, audioPlayerModel),
    );
  }

  Widget _timer(BuildContext context, AudioPlayerModel audioPlayerModel) {
    var style = new TextStyle(
      color: Colors.white,
      fontSize: 15,
    );
    return StreamBuilder<Duration?>(
      stream: audioPlayerModel.audioPlayer.durationStream,
      builder: (context, snapshot) {
        audioPlayerModel.backgroundAudioDurationSeconds =
            snapshot.data != null ? snapshot.data!.inSeconds.toDouble() : 0.0;
        return StreamBuilder<Duration>(
          stream: audioPlayerModel.audioPlayer.positionStream,
          builder: (context, snapshot) {
            audioPlayerModel.backgroundAudioPositionSeconds =
                snapshot.data != null
                    ? snapshot.data!.inSeconds.toDouble()
                    : 0.0;
            if (audioPlayerModel.backgroundAudioPositionSeconds ==
                    audioPlayerModel.backgroundAudioDurationSeconds &&
                audioPlayerModel.backgroundAudioDurationSeconds != 0.0 ) {
              if(!audioPlayerModel.isRepeat!) {
                audioPlayerModel.skipNext();
              }
            }
            if (audioPlayerModel.backgroundAudioPositionSeconds >
                audioPlayerModel.backgroundAudioDurationSeconds) {
              audioPlayerModel.backgroundAudioPositionSeconds =
                  audioPlayerModel.backgroundAudioDurationSeconds;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  TimUtil.stringForSeconds((snapshot.data == null)
                      ? 0.0
                      : audioPlayerModel.backgroundAudioPositionSeconds),
                  style: style,
                ),
                Expanded(
                  child: Slider(
                      max: audioPlayerModel.backgroundAudioDurationSeconds,
                      min: 0,
                      activeColor: Colors.pink,
                      value: audioPlayerModel.backgroundAudioPositionSeconds,
                      onChangeEnd: (v) {
                        audioPlayerModel.onStartSeek(v);
                      },
                      onChanged: (double val) {
                        audioPlayerModel.seekTo(val);
                      }),
                ),
                Text(
                  TimUtil.stringForSeconds(
                      audioPlayerModel.backgroundAudioDurationSeconds),
                  style: style,
                ),
              ],
            );
          },
        );
      },
    );
  }

  /*StreamBuilder(
      initialData: audioPlayerModel.backgroundAudioPositionSeconds,
      stream: audioPlayerModel.audioProgressStreams?.stream.asBroadcastStream(),
      builder: (BuildContext context, snapshot) {
        double? seekSliderValue = 0;
        if (snapshot != null || snapshot.data != null) {
          seekSliderValue = (snapshot.data ??0.0 /
              audioPlayerModel.backgroundAudioDurationSeconds.\


              ());
          if (seekSliderValue.isNaN || seekSliderValue < 0) {
            seekSliderValue = 0;
          }
          if (seekSliderValue > 1) {
            seekSliderValue = 1;
          }
          print("snapshot.data = " + snapshot.data.toString());
          print("backgroundAudioDurationSeconds = " +
              audioPlayerModel.backgroundAudioDurationSeconds.toString());
          print("seekSliderValue = " + seekSliderValue.toString());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              TimUtil.stringForSeconds(
                  (snapshot.data == null)
                      ? 0.0
                      : double.parse(snapshot.data.toString())),
              style: style,
            ),
            Expanded(
              child: Slider(
                  activeColor: Colors.pink,
                  value: seekSliderValue,
                  onChangeEnd: (v) {
                    audioPlayerModel.onStartSeek(v);
                  },
                  onChanged: (double val) {
                    final double positionSeconds =
                        val * audioPlayerModel.backgroundAudioDurationSeconds;
                    audioPlayerModel.seekTo(positionSeconds);
                  }),
            ),
             Text(
              TimUtil.stringForSeconds(
                  audioPlayerModel.backgroundAudioDurationSeconds),
              style: style,
            ),
          ],
        );
      },
    );*/

  List<Widget> _controllers(
      BuildContext context, AudioPlayerModel audioPlayerModel) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {
                audioPlayerModel.skipPrevious();
                Provider.of<MediaPlayerModel>(context, listen: false)
                    .setMediaLikesCommentsCount(audioPlayerModel.currentMedia!);
              },
              icon: Icon(
                //Icons.skip_previous,
                Icons.fast_rewind,
                size: 25.0,
                color: Colors.white,
              ),
            ),
            ClipOval(
                child: Container(
              color: Theme.of(context).colorScheme.secondary.withAlpha(30),
              width: 70.0,
              height: 70.0,
              child: IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                onPressed: () {
                  audioPlayerModel.onPressed();
                },
                icon: audioPlayerModel.icon(),
              ),
            )),
            IconButton(
              onPressed: () {
                audioPlayerModel.skipNext();
                Provider.of<MediaPlayerModel>(context, listen: false)
                    .setMediaLikesCommentsCount(audioPlayerModel.currentMedia!);
              },
              icon: Icon(
                //Icons.skip_next,
                Icons.fast_forward,
                size: 25.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Visibility(
        visible: !audioPlayerModel.showList,
        child: new Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: _timer(context, audioPlayerModel),
        ),
      ),
    ];
  }
}
