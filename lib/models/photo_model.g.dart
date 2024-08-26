// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoModelAdapter extends TypeAdapter<PhotoModel> {
  @override
  final int typeId = 0;

  @override
  PhotoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoModel()
      ..photoPath = fields[0] as String?
      ..timestmap = fields[1] as DateTime?
      ..lat = fields[2] as double?
      ..long = fields[3] as double?;
  }

  @override
  void write(BinaryWriter writer, PhotoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.photoPath)
      ..writeByte(1)
      ..write(obj.timestmap)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
