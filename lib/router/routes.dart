import 'package:get/get.dart';
import 'package:surprise/views/home/home_page.dart';

List<GetPage> getPages() {
  return [
    GetPage(
      name: "/Home",
      page: () => const HomePage(),
    ), // 隐私协议提醒
  ];
}
