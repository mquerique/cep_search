import 'package:cep_search/features/cep_search/domain/entities/cep.dart';

abstract class CepRepository {
  Future<Cep> getCep(String cep);
}
