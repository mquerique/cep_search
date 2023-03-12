import 'dart:convert';

import 'package:cep_search/core/constants/constants.dart';
import 'package:cep_search/core/exceptions/exceptions.dart';
import 'package:cep_search/features/cep_search/data/data_sources/cep_local_data_source.dart';
import 'package:cep_search/features/cep_search/data/models/cep_model.dart';
import 'package:cep_search/features/cep_search/domain/entities/cep.dart';
import 'package:cep_search/service_locator.dart';
import 'package:http/http.dart' as http;

class CepRemoteDataSource {
  final http.Client client;

  const CepRemoteDataSource({
    required this.client,
  });

  Future<Cep> getCep(int cep) async {
    final url = '$kApiBaseUrl/$cep/json/';

    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['erro'] == true) {
        throw CepNotFoundException();
      }
      final cep = CepModel.fromJson(data).toEntity();
      await getIt<CepLocalDataSource>().addCep(cep);
      return cep;
    } else {
      throw ServerException();
    }
  }
}
