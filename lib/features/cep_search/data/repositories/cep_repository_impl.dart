import 'package:cep_search/core/exceptions/exceptions.dart';
import 'package:cep_search/core/network/network_info.dart';
import 'package:cep_search/features/cep_search/data/data_sources/cep_local_data_source.dart';
import 'package:cep_search/features/cep_search/data/data_sources/cep_remote_data_source.dart';
import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:cep_search/features/cep_search/domain/repositories/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  final CepRemoteDataSource remoteDataSource;
  final CepLocalDataSource localDataSource;

  const CepRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Cep> getCep(int cep) async {
    final cachedCep = await localDataSource.getCep(cep);
    if (cachedCep != null) return cachedCep;

    if (!await NetworkInfo.isConnected) {
      throw NoInternetException();
    }
    return remoteDataSource.getCep(cep);
  }
}
