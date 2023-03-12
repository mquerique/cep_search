import 'package:cep_search/core/themes/bloc/theme_bloc.dart';
import 'package:cep_search/service_locator.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.getIt<ThemeBloc>()),
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
