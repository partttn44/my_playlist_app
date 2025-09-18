import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/components/playlist_detail/music_card.dart';
import 'package:music_app/components/playlist_detail/music_progress_section.dart';
import 'package:music_app/components/playlist_detail/playlist_header.dart';
import 'package:music_app/controllers/playlist_detail_controller.dart';
import 'package:music_app/models/music_model.dart';

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
            flexibleSpace: PlaylistHeader(
              controller: controller,
              title: playlist.title ?? '',
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
            child: MusicProgressSection(controller: controller),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.musiclist.length,
              (context, index) {
                final track = controller.musiclist[index];
                return MusicListTile(
                  track: track,
                  index: index,
                  controller: controller,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
