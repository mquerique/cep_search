import 'package:cep_search/core/exceptions/exceptions.dart';
import 'package:cep_search/core/themes/app_themes.dart';
import 'package:cep_search/core/themes/bloc/theme_bloc.dart';
import 'package:cep_search/features/cep_search/presentation/blocs/cep_bloc.dart';
import 'package:cep_search/features/cep_search/presentation/screens/cep_details_screen.dart';
import 'package:cep_search/features/cep_search/presentation/widgets/input_field.dart';
import 'package:cep_search/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CepSearchScreen extends StatefulWidget {
  const CepSearchScreen({Key? key}) : super(key: key);

  @override
  State<CepSearchScreen> createState() => _CepSearchScreenState();
}

class _CepSearchScreenState extends State<CepSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cepInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    final appLocalization = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(appLocalization.appTitle),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (ctx) {
            return [
              PopupMenuItem(
                value: AppTheme.light,
                child: Text(appLocalization.lightMode),
              ),
              PopupMenuItem(
                value: AppTheme.dark,
                child: Text(appLocalization.darkMode),
              ),
            ];
          },
          onSelected: (theme) {
            getIt<ThemeBloc>().add(ThemeChanged(theme: theme));
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<CepBloc, CepState>(
          listener: _handleStateChange,
          builder: _buildContent,
        ),
      ),
    );
  }

  void _handleStateChange(BuildContext context, CepState state) {
    if (state is CepLoadedState) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => CepDetailsScreen(cep: state.cep),
        ),
      );
    }

    if (state is CepErrorState) {
      final String message;
      if (state.exception is CepNotFoundException) {
        message = AppLocalizations.of(context)!.errCepNotFound;
      } else {
        message = AppLocalizations.of(context)!.errSomethingWentWrong;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  Widget _buildContent(BuildContext ctx, CepState state) {
    if (state is CepLoadingState) {
      return const CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.searchCep,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _buildCepInputField(),
        _buildButtonNext()
      ],
    );
  }

  Widget _buildCepInputField() {
    return CepInputField(
      controller: _cepInputController,
    );
  }

  Widget _buildButtonNext() {
    return ElevatedButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;
        getIt<CepBloc>().add(GetCepEvent(cep: _cepInputController.text));
      },
      child: Text(AppLocalizations.of(context)!.search.toUpperCase()),
    );
  }
}
