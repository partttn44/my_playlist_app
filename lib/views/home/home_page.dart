import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/models/music_model.dart';
import 'package:music_app/models/position_data_model.dart';
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
                      return InkWell(
                        onTap: () {
                          controller.onStopMusic();
                          Get.to(() => PlaylistDetailPage(playlist: data));
                        },
                        child: Padding(
                          padding: REdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.w),
                                child: SizedBox(
                                  width: 250.w,
                                  height: 250.w,
                                  child: Image.network(data.picture ?? ''),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title ?? '',
                                        style: TextStyle(
                                          fontSize: 45.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        data.description ?? '',
                                        style: TextStyle(
                                          fontSize: 40.sp,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: Colors.grey,
                                    width: 5.w,
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () =>
                                    controller.onPlayListPlay(data: data),

                                child: Icon(
                                  Icons.play_arrow,
                                  size: 60.r,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

            bottomNavigationBar: controller.playlist.value.id == null
                ? null
                : Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StreamBuilder<PositionData>(
                          stream: controller.audio.positionDataStream,
                          builder: (context, snapshot) {
                            final data =
                                snapshot.data ??
                                PositionData(
                                  Duration.zero,
                                  Duration.zero,
                                  Duration.zero,
                                );
                            return ProgressBar(
                              progress: data.position,
                              buffered: data.buffered,
                              total: data.total,
                              onSeek: controller.audio.player.seek,
                              baseBarColor: Colors.grey.shade300,
                              bufferedBarColor: Colors.grey,
                              progressBarColor: const Color(0xFFE1C15A),
                              thumbColor: const Color(0xFFE1C15A),
                              thumbRadius: 0,
                              thumbGlowRadius: 10,
                              barHeight: 15.h,
                              timeLabelLocation: TimeLabelLocation.none,
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: REdgeInsets.fromLTRB(50, 0, 50, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.w),
                                child: SizedBox(
                                  width: 250.w,
                                  height: 250.w,
                                  child: Image.network(
                                    controller.playlist.value.picture ?? '',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.playlist.value.title ?? '',
                                        style: TextStyle(
                                          fontSize: 45.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        controller.playlist.value.description ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 40.sp,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: controller.onPlayAndPause,
                                  child: Icon(
                                    controller.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 150.r,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
