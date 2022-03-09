import 'bd.dart';
import 'models/cidades_model.dart';
import 'models/estados_model.dart';
import 'repositories/cidades_repository.dart';
import 'repositories/estados_repository.dart';

void main() async {
  final database = Database();
  var mySqlConnection = await database.openConnection();
  await searchEstados(mySqlConnection);
}

Future searchEstados(mysqlConnection) async {
  var estadosRepository = EstadosRepository();
  try {
    List<EstadosModel> estados = await estadosRepository.buscaEstados();

    for (var e in estados) {
      await insertEstadosBd(estado: e, mysqlConnection: mysqlConnection);
    }

    print('Importação completa');
  } on Exception catch (e) {
    print('ERROR: $e');
  }
}

Future<void> getCidades(
    {required ufId,
    required EstadosModel estado,
    required mysqlConnection}) async {
  var cidadesRepository = CidadesRepository();

  try {
    List<CidadesModel> cidades =
        await cidadesRepository.buscarCidades(id: estado.id);
    for (var c in cidades) {
      insertCityBd(ufId: ufId, cidade: c, mysqlConnection: mysqlConnection);
    }
  } on Exception catch (e) {
    print('ERROR: $e');
  }
}

Future insertCityBd(
    {required int ufId,
    required CidadesModel cidade,
    required mysqlConnection}) async {
  try {
    var results = await mysqlConnection
        .query('insert into cidade(id_uf, nome) values(?,?)', [
      ufId,
      cidade.nome,
    ]);
  } on Exception catch (e) {
    print('ERROR: $e');
  }
}

Future insertEstadosBd({required EstadosModel estado, mysqlConnection}) async {
  try {
    var result = await mysqlConnection
        .query('insert into estado(uf, nome) values(?,?)', [
      estado.uf,
      estado.nome,
    ]);

    if (result.insertId != null) {
      var ufId = result.insertId;

      await getCidades(
          ufId: ufId, estado: estado, mysqlConnection: mysqlConnection);
    } else {
      throw Exception();
    }
  } on Exception catch (e) {
    print('ERROR: $e');
  }
}
