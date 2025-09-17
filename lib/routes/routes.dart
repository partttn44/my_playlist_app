import 'package:get/get.dart';
import 'package:music_app/services/api_serviced.dart';
import 'package:music_app/views/home/home_page.dart';

class RoutesPage {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: BindingsBuilder(() {
        Get.put(ApiService());
      }),
    ),
  ];
}
