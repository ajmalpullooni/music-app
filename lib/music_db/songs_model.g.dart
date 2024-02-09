// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongsModelAdapter extends TypeAdapter<SongsModel> {
  @override
  final int typeId = 2;

  @override
  SongsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongsModel(
      title: fields[0] as String,
      id: fields[4] as int,
      songid: fields[2] as int,
      subtitle: fields[1] as String,
      uri: fields[3] as String,
      albm: fields[5] as String,
      isLiked: fields[6] as bool? ?? false ,
    );
  }

  @override
  void write(BinaryWriter writer, SongsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.songid)
      ..writeByte(3)
      ..write(obj.uri)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.albm)
      ..writeByte(6)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
