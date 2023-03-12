import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CepDetailsScreen extends StatefulWidget {
  final Cep cep;

  const CepDetailsScreen({
    Key? key,
    required this.cep,
  }) : super(key: key);

  @override
  State<CepDetailsScreen> createState() => _CepDetailsScreenState();
}

class _CepDetailsScreenState extends State<CepDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.cepDetails),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    final appLocalization = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildDetailsText(
              label: appLocalization.cep,
              text: widget.cep.cep,
            ),
            _buildDetailsText(
              label: appLocalization.streetName,
              text: widget.cep.streetName,
            ),
            _buildDetailsText(
              label: appLocalization.complement,
              text: widget.cep.complement,
            ),
            _buildDetailsText(
              label: appLocalization.neighborhood,
              text: widget.cep.neighborhood,
            ),
            _buildDetailsText(
              label: appLocalization.city,
              text: widget.cep.city,
            ),
            _buildDetailsText(
              label: appLocalization.uf,
              text: widget.cep.uf,
            ),
            _buildDetailsText(
              label: appLocalization.ibge,
              text: widget.cep.ibge,
            ),
            _buildDetailsText(
              label: appLocalization.areaCode,
              text: widget.cep.areaCode,
            ),
            _buildDetailsText(
              label: appLocalization.siafi,
              text: widget.cep.siafi,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsText({
    required String label,
    required String text,
  }) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
