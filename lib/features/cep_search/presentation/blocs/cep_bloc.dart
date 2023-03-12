import 'package:bloc/bloc.dart';
import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:cep_search/features/cep_search/domain/use_cases/get_cep_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cep_event.dart';

part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final GetCepUsecase getCep;

  CepBloc({
    required this.getCep,
  }) : super(CepInitialState()) {
    on<GetCepEvent>((event, emit) async {
      emit(CepLoadingState());
      try {
        final result = await getCep(cep: event.cep);
        emit(CepLoadedState(cep: result));
      } on Exception catch (e) {
        emit(CepErrorState(exception: e));
      }
    });
  }
}
