import 'package:anj_group/constant/hive_const.dart';
import 'package:anj_group/models/photo_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends GetxService {
  static late Box<PhotoModel> photoBox;

  Future<HiveService> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PhotoModelAdapter());
    photoBox = await Hive.openBox(HiveConst.photoBox);

    return this;
  }
}
