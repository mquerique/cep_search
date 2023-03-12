import 'package:cep_search/features/cep_search/domain/entities/cep.dart';

class CepModel extends Cep {
  const CepModel({
    required super.cep,
    required super.streetName,
    required super.complement,
    required super.neighborhood,
    required super.city,
    required super.uf,
    required super.ibge,
    required super.areaCode,
    required super.siafi,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'],
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
