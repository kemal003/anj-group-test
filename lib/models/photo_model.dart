import 'package:hive_flutter/hive_flutter.dart';
part 'photo_model.g.dart';

@HiveType(typeId: 0)
class PhotoModel extends HiveObject {
  @HiveField(0)
  String? photoPath;

  @HiveField(1)
  DateTime? timestmap;

  @HiveField(2)
  double? lat;

  @HiveField(3)
  double? long;
}
