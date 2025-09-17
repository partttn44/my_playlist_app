import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/playlist_detail_controller.dart';
import 'package:music_app/models/music_model.dart';
import 'package:music_app/models/position_data_model.dart';

class PlaylistDetailPage extends StatelessWidget {
  final PlayListModel playlist;

  const PlaylistDetailPage({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    final PlaylistDetailController controller = Get.put(
      PlaylistDetailController(playlist),
    );

    return Scaffold(
      backgroundColor: Color(0xFF204761),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF142E3E),
            expandedHeight: Get.height / 4,
            pinned: true,

            leading: Padding(
              padding: REdgeInsets.all(30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_rounded, size: 60.sp),
              ),
            ),
            title: Text(
              playlist.title ?? '',
              style: TextStyle(
                fontSize: 70.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(
                () => Image.network(
                  controller.musicCover.value,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.music_note, size: 100.r),
                  ),
                ),
              ),
            ),
            actions: [
              Obx(
                () => IconButton(
                  icon: Icon(
                    controller.isPlaying.value
                        ? Icons.pause_circle
                        : Icons.play_circle,
                    size: 100.sp,
                    color: Colors.white,
                  ),
                  onPressed: () => controller.isFirstOpen.value
                      ? controller.onPlayListPlay(index: 0)
                      : controller.onPlayAndPause(),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<PositionData>(
              stream: controller.audio.positionDataStream,
              builder: (context, snapshot) {
                final positionData =
                    snapshot.data ??
                    PositionData(Duration.zero, Duration.zero, Duration.zero);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Padding(
                        padding: REdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Text(
                          controller.musicTitle.value,
                          style: TextStyle(
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: positionData.total.inMilliseconds.toDouble(),
                      value: positionData.position.inMilliseconds
                          .clamp(0, positionData.total.inMilliseconds)
                          .toDouble(),
                      onChanged: (value) async {
                        await controller.audio.player.seek(
                          Duration(milliseconds: value.toInt()),
                        );
                      },
                    ),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(positionData.position),
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _formatDuration(positionData.total),
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.musiclist.length,
                (context, index) {
                  final track = controller.musiclist[index];
                  return ListTile(
                    leading: Image.network(track.album.cover),
                    title: Text(
                      track.title,
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      track.artist.name,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () => controller.onPlayListPlay(index: index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
