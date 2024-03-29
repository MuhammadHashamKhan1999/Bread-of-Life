import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:audiofileplayer/audio_system.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../i18n/strings.g.dart';
import '../screens/SubscriptionScreen.dart';
import '../service/network_image_to_byte.dart';
import '../utils/Alerts.dart';
import '../models/Media.dart';
import '../utils/my_colors.dart';
import '../utils/Utility.dart';

final Logger _logger = Logger('streamit_flutter');

class AudioPlayerModel with ChangeNotifier {
  late BuildContext _context;
  List<Media?> currentPlaylist = [];
  Media? currentMedia;
  int currentMediaPosition = 0;
  Color backgroundColor = MyColors.primary;
  bool isDialogShowing = false;

  double backgroundAudioDurationSeconds = 0.0;
  double backgroundAudioPositionSeconds = 0.0;
  late ja.AudioPlayer _audioPlayer;

  ja.AudioPlayer get audioPlayer => _audioPlayer;

  bool isSeeking = false;
  Audio? _remoteAudio;

  bool remoteAudioPlaying = false;
  bool _remoteAudioLoading = false;
  bool isUserSubscribed = false;
  StreamController<double>? audioProgressStreams;
  bool isRadio = false;
  List<ja.AudioSource> songList = [];

  /// Identifiers for the two custom Android notification buttons.
  static const String replayButtonId = 'replayButtonId';
  static const String newReleasesButtonId = 'newReleasesButtonId';
  static const String skipPreviousButtonId = 'skipPreviousButtonId';
  static const String skipNextButtonId = 'skipNextButtonId';

  AudioPlayerModel() {
    getRepeatMode();
    AudioSystem.instance.addMediaEventListener(_mediaEventListener);
    audioProgressStreams = StreamController<double>.broadcast();
    audioProgressStreams!.add(0);
  }

  bool? _isRepeat = false;

  bool? get isRepeat => _isRepeat;

  changeRepeat() async {
    _isRepeat = !_isRepeat!;
    _isRepeat!
        ? _audioPlayer.setLoopMode(ja.LoopMode.one)
        : _audioPlayer.setLoopMode(ja.LoopMode.off);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("_isRepeatMode", _isRepeat!);
  }

  getRepeatMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("_isRepeatMode") != null) {
      _isRepeat = prefs.getBool("_isRepeatMode");
    }
  }

  setUserSubscribed(bool isUserSubscribed) {
    this.isUserSubscribed = isUserSubscribed;
  }

  setContext(BuildContext context) {
    _context = context;
  }

  bool _showList = false;

  bool get showList => _showList;

  setShowList(bool showList) {
    _showList = showList;
    notifyListeners();
  }

  preparePlaylist(List<Media?> playlist, Media media) async {
    isRadio = false;
    currentPlaylist = playlist;
    startAudioPlayBack(media);
  }

  prepareradioplayer(Media media) {
    isRadio = true;
    currentPlaylist = [];
    currentPlaylist.add(media);
    startAudioPlayBack(media);
  }

  startAudioPlayBack(Media? media) async {
    if (currentMedia != null) {
      _audioPlayer.stop();
      _audioPlayer.dispose();

    }
    currentMedia = media;
    setCurrentMediaPosition();
    _remoteAudioLoading = true;
    remoteAudioPlaying = false;
    notifyListeners();
    //audioProgressStreams.add(0);
    extractDominantImageColor(currentMedia!.coverPhoto);
    _remoteAudio = null;
    //_remoteAudio.dispose();
    if (isRadio) {
      _audioPlayer = ja.AudioPlayer();
      _audioPlayer.setAudioSource(
        ja.AudioSource.uri(
          Uri.parse(currentMedia!.streamUrl!),
          tag:MediaItem(
            id: currentMedia!.streamUrl!,
            title: currentMedia!.title!,
            artist: currentMedia!.category,
            album: currentMedia!.category,
            genre: currentMedia!.category,
            duration: Duration(seconds: backgroundAudioDurationSeconds.toInt()),
            artUri: Uri.parse(currentMedia!.coverPhoto!),
          ),
        ),
      );
      _isRepeat!
          ? _audioPlayer.setLoopMode(ja.LoopMode.one)
          : _audioPlayer.setLoopMode(ja.LoopMode.off);
      _audioPlayer.play();
      /*_remoteAudio = Audio.loadFromRemoteUrl(media!.streamUrl!,
          looping: false,
          onDuration: (double durationSeconds) {
            _remoteAudioLoading = false;
            remoteAudioPlaying = false;
            backgroundAudioDurationSeconds = durationSeconds;
            notifyListeners();
          },
          onPosition: (double positionSeconds) {
            print("positionSeconds = " + positionSeconds.toString());
            backgroundAudioPositionSeconds = positionSeconds;
            //if (isSeeking) return;
            audioProgressStreams!.add(backgroundAudioPositionSeconds);

            if (Utility.isPreviewDuration(
                currentMedia, positionSeconds.round(), isUserSubscribed)) {
              _pauseBackgroundAudio();
              showPreviewSubscribeAlertDialog();
            }

            //TimUtil.parseDuration(event.parameters["progress"].toString());
          },
          //looping: _isRepeat,
          onComplete: () {
            if (_isRepeat!) {
              *//*  backgroundAudioPositionSeconds = 0;
            audioProgressStreams!.add(backgroundAudioPositionSeconds);
            _pauseBackgroundAudio();
            _resumeBackgroundAudio();*//*
              startAudioPlayBack(currentMedia);
            } else {
              skipNext();
            }
          },
          playInBackground: true,
          onError: (String? message) {
            *//*_remoteAudio!.dispose();
          _remoteAudio = null;
          remoteAudioPlaying = false;
          _remoteAudioLoading = false;*//*
            cleanUpResources();
            Alerts.showCupertinoAlert(_context, t.error, message);
          });*/
    } else {
      _audioPlayer = ja.AudioPlayer();

      /*_remoteAudio = Audio.loadFromRemoteUrl(media.streamUrl!,
          onDuration: (double durationSeconds) {
            _remoteAudioLoading = false;
            remoteAudioPlaying = true;
            backgroundAudioDurationSeconds = durationSeconds;
            notifyListeners();
          },
          onPosition: (double positionSeconds) {
            print("positionSeconds = " + positionSeconds.toString());
            backgroundAudioPositionSeconds = positionSeconds;
            //if (isSeeking) return;
            audioProgressStreams!.add(backgroundAudioPositionSeconds);

            if (Utility.isPreviewDuration(
                currentMedia, positionSeconds.round(), isUserSubscribed)) {
              _pauseBackgroundAudio();
              showPreviewSubscribeAlertDialog();
            }

            //TimUtil.parseDuration(event.parameters["progress"].toString());
          },
          //looping: _isRepeat,
          onComplete: () {
            if (_isRepeat!) {
              */ /*backgroundAudioPositionSeconds = 0;
            audioProgressStreams.add(backgroundAudioPositionSeconds);
            _pauseBackgroundAudio();
            _resumeBackgroundAudio();*/ /*
              startAudioPlayBack(currentMedia);
            } else {
              skipNext();
            }
          },
          playInBackground: true,
          onError: (String? message) {
            */ /* _remoteAudio.dispose();
          _remoteAudio = null;
          remoteAudioPlaying = false;
          _remoteAudioLoading = false;*/ /*

            cleanUpResources();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Alerts.showCupertinoAlert(_context, t.error, message);
            });
          })!;*/

      for (var element in currentPlaylist) {
        songList.add(
          ja.AudioSource.uri(
            Uri.parse(element!.streamUrl!),
            tag: MediaItem(
              id: element.streamUrl!,
              title: element.title!,
              artist: element.category,
              album: element.category,
              genre: element.category,
              duration:
                  Duration(seconds: backgroundAudioDurationSeconds.toInt()),
              artUri: Uri.parse(element.coverPhoto!),
            ),
          ),
        );
      }
      _audioPlayer.setAudioSource(
        initialIndex: currentMediaPosition,
        ja.ConcatenatingAudioSource(children: songList),
      );
      _isRepeat!
          ? _audioPlayer.setLoopMode(ja.LoopMode.one)
          : _audioPlayer.setLoopMode(ja.LoopMode.off);
      _audioPlayer.play();
    }
    if(_audioPlayer.playing) {
      _remoteAudioLoading = false;
      remoteAudioPlaying = true;
      notifyListeners();
    }
    //setMediaNotificationData(0);
  }

  showPreviewSubscribeAlertDialog() {
    if (isDialogShowing) return;
    isDialogShowing = true;
    return showDialog(
      context: _context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.subscribehint),
          content: Text(t.previewsubscriptionrequiredhint),
          actions: <Widget>[
            MaterialButton(
              child: Text(t.cancel.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
                isDialogShowing = false;
              },
            ),
            MaterialButton(
              child: Text(t.subscribe),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SubscriptionScreen.routeName);
                isDialogShowing = false;
              },
            )
          ],
        );
      },
    );
  }

  setCurrentMediaPosition() {
    currentMediaPosition = currentPlaylist.indexOf(currentMedia);
    if (currentMediaPosition == -1) {
      currentMediaPosition = 0;
    }
    print("currentMediaPosition = " + currentMediaPosition.toString());
  }

  cleanUpResources() {
    _stopBackgroundAudio();
  }

  Widget icon() {
    if (_remoteAudioLoading) {
      return Theme(
          data: ThemeData(
              cupertinoOverrideTheme:
                  CupertinoThemeData(brightness: Brightness.dark)),
          child: CupertinoActivityIndicator());
    }
    if (remoteAudioPlaying) {
      return const Icon(
        Icons.pause,
        size: 40,
        color: Colors.white,
      );
    }
    return const Icon(
      Icons.play_arrow,
      size: 40,
      color: Colors.white,
    );
  }

  onPressed() {
    return remoteAudioPlaying
        ? _pauseBackgroundAudio()
        : _resumeBackgroundAudio();
  }

  void _mediaEventListener(MediaEvent mediaEvent) {
    _logger.info('App received media event of type: ${mediaEvent.type}');
    final MediaActionType type = mediaEvent.type;
    if (type == MediaActionType.play) {
      _resumeBackgroundAudio();
    } else if (type == MediaActionType.pause) {
      _pauseBackgroundAudio();
    } else if (type == MediaActionType.playPause) {
      remoteAudioPlaying ? _pauseBackgroundAudio() : _resumeBackgroundAudio();
    } else if (type == MediaActionType.stop) {
      _stopBackgroundAudio();
    } else if (type == MediaActionType.seekTo) {
      // _remoteAudio!.seek(mediaEvent.seekToPositionSeconds!);
      _audioPlayer
          .seek(Duration(seconds: mediaEvent.seekToPositionSeconds!.toInt()));
      AudioSystem.instance
          .setPlaybackState(true, mediaEvent.seekToPositionSeconds!);
    } else if (type == MediaActionType.next) {
      print("skip next");
      skipNext();
      final double? skipIntervalSeconds = mediaEvent.skipIntervalSeconds;
      _logger.info(
          'Skip-forward event had skipIntervalSeconds $skipIntervalSeconds.');
      _logger.info('Skip-forward is not implemented in this example app.');
    } else if (type == MediaActionType.previous) {
      print("skip next");
      skipPrevious();
      final double? skipIntervalSeconds = mediaEvent.skipIntervalSeconds;
      _logger.info(
          'Skip-backward event had skipIntervalSeconds $skipIntervalSeconds.');
      _logger.info('Skip-backward is not implemented in this example app.');
    } else if (type == MediaActionType.custom) {
      if (mediaEvent.customEventId == replayButtonId) {
        _audioPlayer.play();
        // _remoteAudio!.play();
        AudioSystem.instance.setPlaybackState(true, 0.0);
      } else if (mediaEvent.customEventId == newReleasesButtonId) {
        _logger
            .info('New-releases button is not implemented in this exampe app.');
      }
    }
  }

  Future<void> _resumeBackgroundAudio() async {
    // _remoteAudio!.resume();
    _audioPlayer.play();
    remoteAudioPlaying = true;
    notifyListeners();
  }

  void _pauseBackgroundAudio() {
    _audioPlayer.pause();
    //_remoteAudio!.pause();
    remoteAudioPlaying = false;
    notifyListeners();
  }

  void stopBackgroundAudio() {
    _audioPlayer.pause();
    //_remoteAudio!.pause();
    _audioPlayer.dispose();
    // _remoteAudio!.removeCallbacks();
    // _remoteAudio!.dispose();
    currentMedia = null;
    notifyListeners();
    AudioSystem.instance.stopBackgroundDisplay();
  }

  void _stopBackgroundAudio() {
    _audioPlayer.pause();
    // _remoteAudio!.pause();
    currentMedia = null;
    notifyListeners();
    // setState(() => _backgroundAudioPlaying = false);
    AudioSystem.instance.stopBackgroundDisplay();
  }

  void shufflePlaylist() {
    currentPlaylist.shuffle();
    _audioPlayer.shuffle();
  }

  skipPrevious() {
    if (currentPlaylist.length == 0 || currentPlaylist.length == 1) return;
    int pos = currentMediaPosition - 1;
    if (pos == -1) {
      pos = currentPlaylist.length - 1;
    }
    Media? media = currentPlaylist[pos];
    if (Utility.isMediaRequireUserSubscription(media, isUserSubscribed)) {
      Alerts.showPlaySubscribeAlertDialog(_context);
      return;
    } else if(_audioPlayer.hasPrevious) {
      currentMedia = media;
      setCurrentMediaPosition();
      _audioPlayer.seekToPrevious();
    }
    notifyListeners();
  }

  skipNext() async {
    if (currentPlaylist.length == 0 || currentPlaylist.length == 1) return;
    int pos = currentMediaPosition + 1;
    if (pos >= currentPlaylist.length) {
      pos = 0;
    }
    Media? media = currentPlaylist[pos];
    if (Utility.isMediaRequireUserSubscription(media, isUserSubscribed)) {
      Alerts.showPlaySubscribeAlertDialog(_context);
      return;
    } else if(_audioPlayer.hasNext){
      currentMedia = media;
      setCurrentMediaPosition();
      audioPlayer.seekToNext();
    }
    notifyListeners();
  }

  seekTo(double positionSeconds) {
    //audioProgressStreams.add(_backgroundAudioPositionSeconds);
    //_remoteAudio.seek(positionSeconds);
    isSeeking = false;
    backgroundAudioPositionSeconds = positionSeconds;
    _audioPlayer.seek(Duration(seconds: positionSeconds.round()));
    //audioProgressStreams!.add(backgroundAudioPositionSeconds);
    //AudioSystem.instance.setPlaybackState(true, positionSeconds);
    notifyListeners();
  }

  onStartSeek(value) {
    _audioPlayer.seek(Duration(seconds: value.round()));
    isSeeking = true;
    notifyListeners();
  }

  /// Generates a 200x200 png, with randomized colors, to use as art for the
  /// notification/lockscreen.
  static Future<Uint8List> generateImageBytes(String coverphoto) async {
    Uint8List byteImage = await networkImageToByte(coverphoto);
    return byteImage;
  }

  setMediaNotificationData(int state) async {
    // final Uint8List imageBytes =
    //   await generateImageBytes(currentMedia.cover_photo);

    if (state == 0) {
      AudioSystem.instance
          .setPlaybackState(true, backgroundAudioPositionSeconds);
      AudioSystem.instance.setAndroidNotificationButtons(<dynamic>[
        AndroidMediaButtonType.pause,
        AndroidMediaButtonType.previous,
        AndroidMediaButtonType.next,
        AndroidMediaButtonType.stop,
        const AndroidCustomMediaButton(
            'replay', replayButtonId, 'ic_replay_black_36dp')
      ], androidCompactIndices: <int>[
        0
      ]);
    } else {
      AudioSystem.instance
          .setPlaybackState(false, backgroundAudioPositionSeconds);
      AudioSystem.instance.setAndroidNotificationButtons(<dynamic>[
        AndroidMediaButtonType.play,
        AndroidMediaButtonType.previous,
        AndroidMediaButtonType.next,
        AndroidMediaButtonType.stop,
        const AndroidCustomMediaButton(
            'replay', replayButtonId, 'ic_replay_black_36dp')
      ], androidCompactIndices: <int>[
        0
      ]);
    }

    AudioSystem.instance.setMetadata(AudioMetadata(
        title: currentMedia!.title,
        artist: currentMedia!.category,
        album: currentMedia!.category,
        genre: currentMedia!.category,
        durationSeconds: backgroundAudioDurationSeconds,
        artBytes: await networkImageToByte(currentMedia!.coverPhoto!)));

    AudioSystem.instance.setSupportedMediaActions(<MediaActionType>{
      MediaActionType.playPause,
      MediaActionType.pause,
      MediaActionType.next,
      MediaActionType.previous,
      MediaActionType.skipForward,
      MediaActionType.skipBackward,
      MediaActionType.seekTo,
    }, skipIntervalSeconds: 30);
  }

  extractDominantImageColor(String? url) async {
    if (url == "" || isRadio) {
      backgroundColor = MyColors.primary;
      notifyListeners();
    } else {
      PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        NetworkImage(url!),
      );
      if (paletteGenerator.dominantColor != null) {
        backgroundColor = paletteGenerator.dominantColor!.color;
        notifyListeners();
      } else {
        backgroundColor = MyColors.primary;
        notifyListeners();
      }
    }
  }
}
