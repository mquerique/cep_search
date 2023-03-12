import 'package:equatable/equatable.dart';

class Cep extends Equatable {
  final String cep;
  final String streetName;
  final String complement;
  final String neighborhood;
  final String city;
  final String uf;
  final String ibge;
  final String areaCode;
  final String siafi;

  const Cep({
    required this.cep,
    required this.streetName,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.uf,
    required this.ibge,
    required this.areaCode,
    required this.siafi,
  });

  @override
  List<Object?> get props => [
        cep,
        streetName,
        complement,
        neighborhood,
        city,
        uf,
        ibge,
        areaCode,
        siafi,
      ];
}
