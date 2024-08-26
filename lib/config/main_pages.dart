import 'package:anj_group/config/main_route.dart';
import 'package:anj_group/modules/covid_api/covid_api_controller.dart';
import 'package:anj_group/modules/covid_api/covid_api_screen.dart';
import 'package:anj_group/modules/home/home_controller.dart';
import 'package:anj_group/modules/home/home_screen.dart';
import 'package:anj_group/modules/image_viewer/image_viewer_controller.dart';
import 'package:anj_group/modules/image_viewer/image_viewer_screen.dart';
import 'package:anj_group/modules/list_data/list_data_controller.dart';
import 'package:anj_group/modules/list_data/list_data_screen.dart';
import 'package:anj_group/modules/photo/photo_controller.dart';
import 'package:anj_group/modules/photo/photo_screen.dart';
import 'package:get/get.dart';

class MainPages {
  static final List<GetPage> pages = [
    GetPage(
      name: MainRoute.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder.put(() => HomeController()),
    ),
    GetPage(
      name: MainRoute.photo,
      page: () => const PhotoScreen(),
      binding: BindingsBuilder.put(() => PhotoController()),
    ),
    GetPage(
      name: MainRoute.listData,
      page: () => const ListDataScreen(),
      binding: BindingsBuilder.put(() => ListDataController()),
    ),
    GetPage(
      name: MainRoute.imageViewer,
      page: () => const ImageViewerScreen(),
      binding: BindingsBuilder.put(() => ImageViewerController()),
    ),
    GetPage(
      name: MainRoute.covidApi,
      page: () => const CovidApiScreen(),
      binding: BindingsBuilder.put(() => CovidApiController()),
    ),
  ];
}
