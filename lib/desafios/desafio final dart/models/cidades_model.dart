import 'dart:convert';

class CidadesModel {
  String idUf;
  String nome;
  CidadesModel({
    required this.idUf,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUf': idUf,
      'nome': nome,
    };
  }

  factory CidadesModel.fromMap(Map<String, dynamic> map) {
    return CidadesModel(
      idUf: map['idUf'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadesModel.fromJson(String source) =>
      CidadesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CidadesModel(idUf: $idUf, nome: $nome)';
}
