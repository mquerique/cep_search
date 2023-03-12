import 'package:cep_search/core/themes/bloc/theme_bloc.dart';
import 'package:cep_search/features/cep_search/data/data_sources/cep_remote_data_source.dart';
import 'package:cep_search/features/cep_search/data/repositories/cep_repository_impl.dart';
import 'package:cep_search/features/cep_search/domain/repositories/cep_repository.dart';
import 'package:cep_search/features/cep_search/domain/use_cases/get_cep_usecase.dart';
import 'package:cep_search/features/cep_search/presentation/blocs/cep_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  // Blocs
  getIt.registerLazySingleton(() => ThemeBloc());
  getIt.registerLazySingleton(() => CepBloc(getCep: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetCepUsecase(getIt()));

  // Repositories
  getIt.registerLazySingleton<CepRepository>(
      () => CepRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<CepRemoteDataSource>(
      () => CepRemoteDataSource(client: getIt()));

  // Extras
  getIt.registerLazySingleton(() => http.Client());
}
