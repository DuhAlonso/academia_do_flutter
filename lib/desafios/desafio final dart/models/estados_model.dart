import 'dart:convert';

class EstadosModel {
  int id;
  String uf;
  String nome;
  EstadosModel({
    required this.id,
    required this.uf,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uf': uf,
      'nome': nome,
    };
  }

  factory EstadosModel.fromMap(Map<String, dynamic> map) {
    return EstadosModel(
      id: map['id']?.toInt() ?? 0,
      uf: map['uf'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadosModel.fromJson(String source) =>
      EstadosModel.fromMap(json.decode(source));

  @override
  String toString() => 'EstadosModel(id: $id, uf: $uf, nome: $nome)';
}
