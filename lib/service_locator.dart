import 'package:cep_search/core/themes/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Blocs
  getIt.registerLazySingleton(() => ThemeBloc());

  // Use cases

  // Repositories

  // Data sources
}
