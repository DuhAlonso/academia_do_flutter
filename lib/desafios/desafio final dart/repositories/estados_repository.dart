import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/estados_model.dart';

class EstadosRepository {
  Future<List<EstadosModel>> buscaEstados() async {
    var urlEstados =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    var response = await http.get(Uri.parse(urlEstados));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => EstadosModel.fromMap(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}
