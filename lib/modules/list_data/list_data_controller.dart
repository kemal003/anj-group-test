import 'package:anj_group/models/photo_model.dart';
import 'package:anj_group/services/hive_service.dart';
import 'package:get/get.dart';

class ListDataController extends GetxController {
  static ListDataController get to => Get.find();
  List<PhotoModel> listData = [];

  Future<void> getData() async {
    listData = HiveService.photoBox.values.toList().reversed.toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
