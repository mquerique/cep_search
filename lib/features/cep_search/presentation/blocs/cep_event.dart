part of 'cep_bloc.dart';

abstract class CepEvent extends Equatable {
  const CepEvent();

  @override
  List<Object?> get props => [];
}

class GetCepEvent extends CepEvent {
  final String cep;

  const GetCepEvent({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
