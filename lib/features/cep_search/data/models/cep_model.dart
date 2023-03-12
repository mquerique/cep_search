import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:hive/hive.dart';

part 'cep_model.g.dart';

@HiveType(typeId: 0)
class CepModel extends HiveObject {
  @HiveField(0)
  final String cep;
  @HiveField(1)
  final String streetName;
  @HiveField(2)
  final String complement;
  @HiveField(3)
  final String neighborhood;
  @HiveField(4)
  final String city;
  @HiveField(5)
  final String uf;
  @HiveField(6)
  final String ibge;
  @HiveField(7)
  final String areaCode;
  @HiveField(8)
  final String siafi;

  CepModel({
    required this.cep,
    required this.streetName,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
    required this.ibge,
    required this.areaCode,
    required this.siafi,
  }) : super();

  factory CepModel.fromEntity(Cep cep) {
    return CepModel(
      cep: cep.cep,
      streetName: cep.streetName,
      complement: cep.complement,
      neighborhood: cep.neighborhood,
      city: cep.city,
      uf: cep.uf,
      ibge: cep.ibge,
      areaCode: cep.areaCode,
      siafi: cep.siafi,
    );
  }

  Cep toEntity() {
    return Cep(
      cep: cep,
      streetName: streetName,
      complement: complement,
      neighborhood: neighborhood,
      city: city,
      uf: uf,
      ibge: ibge,
      areaCode: areaCode,
      siafi: siafi,
    );
  }

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: (json['cep'] as String).replaceAll('-', ''),
      streetName: json['logradouro'],
      complement: json['complemento'],
      neighborhood: json['bairro'],
      city: json['localidade'],
      uf: json['uf'],
      ibge: json['ibge'],
      areaCode: json['ddd'],
      siafi: json['siafi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'streetName': streetName,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'ibge': ibge,
      'areaCode': areaCode,
      'siafi': siafi,
    };
  }
}
