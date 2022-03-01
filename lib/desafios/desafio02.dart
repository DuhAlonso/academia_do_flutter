void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  List pessoas1 = [...pessoas.toSet()];
  print(pessoas1);

  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  final masculino = [];
  final feminino = [];
  int qtdMasculino = 0;
  int qtdFeminino = 0;
  for (var pessoa in pessoas1) {
    final pessoaDados = pessoa.split('|');
    final nome = pessoaDados[0];
    final genero = pessoaDados[2];
    if (genero == 'Masculino') {
      masculino.add(nome);
      qtdMasculino++;
    }
    if (genero == 'Feminino') {
      feminino.add(nome);
      qtdFeminino++;
    }
  }
  print('Maculinos: $qtdMasculino - $masculino');
  print('Femininos: $qtdFeminino - $feminino');

  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome

  List pessoasIdade = [];
  for (var pessoa in pessoas1) {
    final pessoaDados = pessoa.split('|');
    final idade = int.tryParse(pessoaDados[1] ?? 0);

    if (idade! > 18) {
      pessoasIdade.add(pessoaDados[0]);
    }
  }
  print('pessoas maiores de 18 anos');
  print(pessoasIdade);

  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.
  pessoas1.sort((pessoa01, pessoa02) {
    final pessoaDados1 = pessoa01.split('|');
    final pessoaDados2 = pessoa02.split('|');
    final idadepessoa1 = int.parse(pessoaDados1[1]);
    final idadepessoa2 = int.parse(pessoaDados2[1]);
    return idadepessoa1.compareTo(idadepessoa2);
  });
  print(pessoas1.last);
}
