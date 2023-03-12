import 'package:cep_search/features/cep_search/data/data_sources/cep_remote_data_source.dart';
import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:cep_search/features/cep_search/domain/repositories/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  final CepRemoteDataSource remoteDataSource;

  const CepRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Cep> getCep(int cep) {
    return remoteDataSource.getCep(cep);
  }
}
