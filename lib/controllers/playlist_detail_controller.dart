import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/models/music_model.dart';
import 'package:music_app/utils/audio_funtion.dart';
import 'package:music_app/utils/get_color_image.dart';

class PlaylistDetailController extends GetxController {
  final PlayListModel playList;
  PlaylistDetailController(this.playList);

  final audio = AudioFunction();
  final isPlaying = false.obs;

  final musicTitle = ''.obs;
  final musicCover = ''.obs;
  final musicArtist = ''.obs;
  final musicDuration = 0.obs;
  final musicIndex = 0.obs;

  Rx<int> currentIndex = 0.obs;

  Rx<Color> bgColor = Colors.white.obs;

  RxList<Data> musiclist = <Data>[].obs;

  Rx<bool> isFirstOpen = true.obs;

  @override
  void onInit() {
    super.onInit();
    getColorImage();
    musiclist.assignAll(
      playList.tracks!.data.where((track) => track.preview.isNotEmpty).toList(),
    );

    if (musiclist.isNotEmpty) {
      _updateMusicFields(currentIndex.value);
    }

    audio.playingStream.listen((playing) {
      isPlaying.value = playing;
    });

    audio.player.currentIndexStream.listen((index) {
      if (index != null) {
        currentIndex.value = index;
        _updateMusicFields(currentIndex.value);
      }
    });

    audio.player.positionStream.listen((position) async {
      final duration = audio.player.duration;
      if (duration != null && position >= duration) {
        await _playNextTrack();
      }
    });
  }

  @override
  void onClose() {
    audio.dispose();
    super.onClose();
  }

  void getColorImage() async {
    bgColor.value = await getDominantColorFromPath(
      playList.pictureBig ?? playList.picture!,
    );
  }

  Future<void> onPlayListPlay({required int index}) async {
    isFirstOpen.value = false;
    currentIndex.value = index;
    _updateMusicFields(currentIndex.value);

    if (musiclist.isNotEmpty) {
      await audio.playFromSelectedTrackList(musiclist, currentIndex.value);
    }
  }

  Future<void> onPlayAndPause() async => await audio.togglePlayPause();

  Future<void> onStopMusic() async => await audio.stop();

  Future<void> _playNextTrack() async {
    final nextIndex = currentIndex.value + 1;
    if (nextIndex < musiclist.length) {
      currentIndex.value = nextIndex;
      _updateMusicFields(currentIndex.value);

      await audio.playFromSelectedTrackList(musiclist, currentIndex.value);
    } else {
      await audio.stop();
    }
  }

  void _updateMusicFields(int index) {
    final track = musiclist[index];
    musicTitle.value = track.title;
    musicCover.value = track.album.cover;
    musicArtist.value = track.artist.name;
    musicDuration.value = track.duration;
    musicIndex.value = index;
  }
}
