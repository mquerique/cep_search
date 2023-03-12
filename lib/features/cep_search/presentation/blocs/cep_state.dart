part of 'cep_bloc.dart';

abstract class CepState extends Equatable {
  const CepState();

  @override
  List<Object> get props => [];
}

class CepInitialState extends CepState {}

class CepLoadingState extends CepState {}

class CepLoadedState extends CepState {
  final Cep cep;

  const CepLoadedState({required this.cep});

  @override
  List<Object> get props => [cep];
}

class CepErrorState extends CepState {
  final Exception exception;

  const CepErrorState({required this.exception});

  @override
  List<Object> get props => [exception];
}
