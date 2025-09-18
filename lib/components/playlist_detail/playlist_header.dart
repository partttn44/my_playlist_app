import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/playlist_detail_controller.dart';

class PlaylistHeader extends StatelessWidget {
  final PlaylistDetailController controller;
  final String title;

  const PlaylistHeader({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 70.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
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
    );
  }
}
