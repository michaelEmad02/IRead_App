// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_status_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookStatusEntityAdapter extends TypeAdapter<BookStatusEntity> {
  @override
  final int typeId = 2;

  @override
  BookStatusEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookStatusEntity(
      status: fields[2] as String,
      pagesReadedCount: fields[4] as int,
      title: fields[0] as String,
      image: fields[1] as String,
      pagesCount: fields[3] as int,
      bookPath: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookStatusEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.pagesCount)
      ..writeByte(4)
      ..write(obj.pagesReadedCount)
      ..writeByte(5)
      ..write(obj.bookPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookStatusEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
