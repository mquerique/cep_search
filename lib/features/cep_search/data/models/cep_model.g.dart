// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CepModelAdapter extends TypeAdapter<CepModel> {
  @override
  final int typeId = 0;

  @override
  CepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CepModel(
      cep: fields[0] as String,
      streetName: fields[1] as String,
      complement: fields[2] as String,
      neighborhood: fields[3] as String,
      city: fields[4] as String,
      uf: fields[5] as String,
      ibge: fields[6] as String,
      areaCode: fields[7] as String,
      siafi: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CepModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.cep)
      ..writeByte(1)
      ..write(obj.streetName)
      ..writeByte(2)
      ..write(obj.complement)
      ..writeByte(3)
      ..write(obj.neighborhood)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.uf)
      ..writeByte(6)
      ..write(obj.ibge)
      ..writeByte(7)
      ..write(obj.areaCode)
      ..writeByte(8)
      ..write(obj.siafi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
