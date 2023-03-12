import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:cep_search/features/cep_search/domain/repositories/cep_repository.dart';

class GetCepUsecase {
  final CepRepository repository;

  const GetCepUsecase(this.repository);

  Future<Cep> call({required String cep}) {
    return repository.getCep(cep);
  }
}
