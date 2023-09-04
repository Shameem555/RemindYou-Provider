// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 1;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      title: fields[0] as String,
      catogory: fields[1] as String,
      dateTime: fields[2] as DateTime,
      timeOfDay: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.catogory)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.timeOfDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
