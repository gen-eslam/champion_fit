import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class YouTube {
  YoutubePlayerController getController(
      {required String videoId, required YoutubePlayerFlags flags}) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: flags,
    );
  }

  static YoutubePlayerFlags getFlags({
    required int startAt,
    required int endAt,
  }) {
    return YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      isLive: false,
      startAt: startAt,
      endAt: endAt,
    );
  }

  static String? getThumbnail(String id) =>
      'https://img.youtube.com/vi/$id/0.jpg';
  static String? getVideoId(String url) => YoutubePlayer.convertUrlToId(url);
}

abstract class TimeConverter {
  static String convertToTime({required int seconds}) {
    String minutes = (seconds / 60).floor().toString();
    String sec = (seconds % 60).toString();
    return '$minutes:$sec';
  }

  static int convertToSeconds({required String time}) {
    String min = time.split(':')[0];
    String sec = time.split(':')[1];
    return int.parse(min) * 60 + int.parse(sec);
  }

  static String getTotalTime(
      {required String startTime, required String endTime}) {
    int start = TimeConverter.convertToSeconds(time: startTime);
    int end = TimeConverter.convertToSeconds(time: endTime);
    return convertToTime(seconds: end - start);
  }
}
