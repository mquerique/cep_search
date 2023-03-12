import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validators {
  static String? nullOrEmptyValidator({
    required BuildContext context,
    required String? val,
  }) {
    if (val == null || val.isEmpty) {
      return AppLocalizations.of(context)!.errFieldRequired;
    }
    return null;
  }

  static String? lengthValidator({
    required BuildContext context,
    required String? val,
    required int minLength,
  }) {
    if (val == null || val.length < minLength) {
      return AppLocalizations.of(context)!.errInvalidFormat;
    }
    return null;
  }
}
