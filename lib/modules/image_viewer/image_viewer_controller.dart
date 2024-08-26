import 'package:anj_group/models/photo_model.dart';
import 'package:get/get.dart';

class ImageViewerController extends GetxController {
  static ImageViewerController get to => Get.find();

  late PhotoModel selectedData;

  @override
  void onInit() {
    super.onInit();
    selectedData = Get.arguments;
  }
}
