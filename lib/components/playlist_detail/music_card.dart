import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/playlist_detail_controller.dart';
import 'package:music_app/models/music_model.dart';

class MusicListTile extends StatelessWidget {
  final Data track;
  final int index;
  final PlaylistDetailController controller;

  const MusicListTile({
    super.key,
    required this.track,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isPlayingTrack =
          controller.currentIndex.value == index &&
          !controller.isFirstOpen.value;

      return Container(
        color: isPlayingTrack ? Colors.blue.shade100 : Colors.transparent,
        child: ListTile(
          leading: Stack(
            children: [
              SizedBox(
                width: 150.w,
                height: 150.w,
                child: Image.network(track.album.cover, fit: BoxFit.fill),
              ),
              if (isPlayingTrack)
                Positioned.fill(
                  child: Container(
                    color: Colors.black26,
                    child: Center(
                      child: Icon(
                        Icons.equalizer_rounded,
                        size: 100.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(track.title),
          subtitle: Text(track.artist.name),
          onTap: () => controller.onPlayListPlay(index: index),
        ),
      );
    });
  }
}
