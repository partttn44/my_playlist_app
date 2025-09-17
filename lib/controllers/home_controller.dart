// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:music_app/utils/audio_funtion.dart';

import 'package:music_app/models/music_model.dart';
import 'package:music_app/services/api_serviced.dart';

class HomeController extends GetxController {
  final ApiService api;
  HomeController(this.api);

  final isLoading = false.obs;
  final playlists = <PlayListModel>[].obs;
  Rx<PlayListModel> playlist = PlayListModel().obs;

  final audio = AudioFunction();
  final isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllPlayList();

    audio.playingStream.listen((playing) {
      isPlaying.value = playing;
    });
  }

  @override
  void onClose() {
    audio.dispose();
    super.onClose();
  }

  Future<void> getAllPlayList() async {
    isLoading.value = true;
    try {
      final data = await api.getAllPlayList();
      playlists.value = data;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onPlayListPlay({required PlayListModel data}) async {
    playlist.value = data;
    await audio.playPlaylist(data);
  }

  Future<void> onPlayAndPause() async => await audio.togglePlayPause();

  Future<void> onStopMusic() async => await audio.stop();
}
