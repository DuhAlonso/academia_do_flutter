void main() {
  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //! Baseado no array acima monte um relatório onde:

  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  print('Pacientes com mais de 20 anos:');
  for (final paciente in pacientes) {
    final pacDados = paciente.split('|');
    final idade = int.tryParse(pacDados[1]) ?? 0;
    if (idade > 20) {
      print(pacDados[0]);
    }
  }
  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  print('Ppacientes por profissão:');
  final desenvolvedor = [];
  final estudantes = [];
  final dentistas = [];
  final jornalistas = [];
  for (final paciente in pacientes) {
    final pacDados = paciente.split('|');
    final profissao = pacDados[2].toLowerCase();

    if (profissao == 'desenvolvedor') {
      desenvolvedor.add(pacDados[0]);
    }
    if (profissao == 'estudante') {
      estudantes.add(pacDados[0]);
    }
    if (profissao == 'dentista') {
      dentistas.add(pacDados[0]);
    }
    if (profissao == 'jornalista') {
      jornalistas.add(pacDados[0]);
    }
  }
  print('desenvolvedores: ${desenvolvedor.length}');
  print('estudantes: ${estudantes.length}');
  print('dentistas: ${dentistas.length}');
  print('jornalistas: ${jornalistas.length}');

  //! 3 - Apresente a quantidade de pacientes que moram em SP
  print('Pacientes que moram em SP:');
  for (final paciente in pacientes) {
    final pacDados = paciente.split('|');
    final estado = pacDados[3].toLowerCase();
    if (estado == 'sp') {
      print(pacDados[0]);
    }
  }
}
