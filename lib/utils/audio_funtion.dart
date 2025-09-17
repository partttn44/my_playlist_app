import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/music_model.dart';
import 'package:music_app/models/position_data_model.dart';
import 'package:music_app/utils/progress_bar_function.dart';

class AudioFunction {
  final AudioPlayer player = AudioPlayer();

  Future<void> playPlaylist(PlayListModel playlist) async {
    final tracks = playlist.tracks?.data;
    if (tracks == null || tracks.isEmpty) return;

    final sources = tracks
        .where((t) => t.preview != '' && t.preview.isNotEmpty)
        .map((t) => AudioSource.uri(Uri.parse(t.preview)))
        .toList();

    if (sources.isEmpty) return;

    final playlistSource = ConcatenatingAudioSource(children: sources);

    try {
      await player.stop();
      await player.setAudioSource(playlistSource);
      await player.play();
    } catch (e) {
      print('Error setting audio source: $e');
    }
  }

  Future<void> playFromSelectedTrackList(
    List<Data> tracks,
    int startIndex,
  ) async {
    if (tracks.isEmpty) return;

    final sources = tracks
        .map((t) => AudioSource.uri(Uri.parse(t.preview)))
        .toList();

    final playlistSource = ConcatenatingAudioSource(children: sources);

    final safeIndex = startIndex.clamp(0, tracks.length - 1);

    try {
      await player.stop();
      await player.setAudioSource(playlistSource, initialIndex: safeIndex);
      await player.play();
    } catch (e) {
      print('Error playing track: $e');
    }
  }

  Future<void> togglePlayPause() async {
    if (player.playing) {
      await player.pause();
    } else {
      try {
        await player.play();
      } catch (e) {
        print('Play error: $e');
      }
    }
  }

  Future<void> stop() async => await player.stop();

  Stream<PositionData> get positionDataStream => combinePositionStreams(
    positionStream: player.positionStream,
    bufferedStream: player.bufferedPositionStream,
    durationStream: player.durationStream,
  );

  Stream<bool> get playingStream => player.playingStream;

  void dispose() => player.dispose();
}
