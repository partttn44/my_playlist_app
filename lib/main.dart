import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/routes.dart';
import 'package:music_app/services/api_serviced.dart';
import 'package:music_app/views/home/home_page.dart';

void main() {
  Get.put(ApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GetMaterialApp(
      title: 'Music Playlist App',
      debugShowCheckedModeBanner: false,

      // หน้าแรก
      home: ScreenUtilInit(
        designSize: isPortrait ? Size(1080, 2400) : Size(2400, 1080),
        child: const HomePage(),
      ),
      getPages: RoutesPage.routes,
    );
  }
}
