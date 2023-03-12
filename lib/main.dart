import 'package:cep_search/core/themes/bloc/theme_bloc.dart';
import 'package:cep_search/features/cep_search/presentation/blocs/cep_bloc.dart';
import 'package:cep_search/features/cep_search/presentation/screens/cep_search_screen.dart';
import 'package:cep_search/service_locator.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await sl.setup();
  await sl.getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.getIt<ThemeBloc>()),
        BlocProvider(create: (_) => sl.getIt<CepBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildApp,
      ),
    );
  }

  Widget _buildApp(BuildContext context, ThemeState state) {
    return MaterialApp(
      onGenerateTitle: (ctx) {
        return AppLocalizations.of(ctx)!.appTitle;
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: state.themeData,
      home: const CepSearchScreen(),
    );
  }
}
