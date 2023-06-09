import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cep_search/core/themes/app_themes.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.light]!)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(themeData: appThemeData[event.theme]!));
    });
  }
}
