import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/models/music_model.dart';

class PlaylistItem extends StatelessWidget {
  final PlayListModel data;
  final VoidCallback onTap;
  final VoidCallback onPlay;

  const PlaylistItem({
    super.key,
    required this.data,
    required this.onTap,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 50, vertical: 25),
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
                padding: REdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(fontSize: 40.sp, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.grey, width: 5.w),
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
              ),
              onPressed: onPlay,
              child: Icon(Icons.play_arrow, size: 60.r, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
