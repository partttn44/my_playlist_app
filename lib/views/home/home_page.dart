import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/components/home/playing_bar.dart';
import 'package:music_app/components/home/playlist_item.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/models/music_model.dart';
import 'package:music_app/views/playlist/playlist_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController(Get.find()));

    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: Obx(
          () => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              title: Text(
                'My Playlist',
                style: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            body: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.playlists.length,
                    itemBuilder: (context, index) {
                      final PlayListModel data = controller.playlists[index];
                      return PlaylistItem(
                        data: data,
                        onTap: () {
                          controller.onStopMusic();
                          Get.to(() => PlaylistDetailPage(playlist: data));
                        },
                        onPlay: () => controller.onPlayListPlay(data: data),
                      );
                    },
                  ),
            bottomNavigationBar: controller.playlist.value.id == null
                ? null
                : PlayingBar(controller: controller),
          ),
        ),
      ),
    );
  }
}
