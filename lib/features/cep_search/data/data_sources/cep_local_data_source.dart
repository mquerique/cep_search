import 'package:cep_search/features/cep_search/data/models/cep_model.dart';
import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:hive/hive.dart';

class CepLocalDataSource {
  late Box<CepModel> cepBox;

  CepLocalDataSource({required this.cepBox});

  static Future<Box<CepModel>> init() async {
    Hive.registerAdapter(CepModelAdapter());
    return await Hive.openBox<CepModel>('cep');
  }

  Future<Cep?> getCep(int cep) async {
    return cepBox.get(cep.toString())?.toEntity();
  }

  Future<void> addCep(Cep cep) async {
    cepBox.put(cep.cep, CepModel.fromEntity(cep));
  }
}
