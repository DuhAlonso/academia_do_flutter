import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cidades_model.dart';

class CidadesRepository {
  Future<List<CidadesModel>> buscarCidades({required int id}) async {
    var urlCidades =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${id.toString()}/distritos';

    var response = await http.get(Uri.parse(urlCidades));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => CidadesModel.fromMap(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}
