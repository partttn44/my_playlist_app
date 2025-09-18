import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/playlist_detail_controller.dart';
import 'package:music_app/models/position_data_model.dart';

class MusicProgressSection extends StatelessWidget {
  final PlaylistDetailController controller;

  const MusicProgressSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
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
                    style: TextStyle(fontSize: 30.sp, color: Colors.white),
                  ),
                  Text(
                    _formatDuration(positionData.total),
                    style: TextStyle(fontSize: 30.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
