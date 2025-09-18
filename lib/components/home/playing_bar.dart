import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/models/position_data_model.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayingBar extends StatelessWidget {
  final HomeController controller;

  const PlayingBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<PositionData>(
            stream: controller.audio.positionDataStream,
            builder: (context, snapshot) {
              final data =
                  snapshot.data ??
                  PositionData(Duration.zero, Duration.zero, Duration.zero);
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
                    padding: REdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller.playlist.value.description ?? '',
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
    );
  }
}
