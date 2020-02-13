class Equipamento {
  final int id;
  final String nome;
  final String local;
  final String cadastrante;

  Equipamento(
    this.id,
    this.nome,
    this.local,
    this.cadastrante,
  );

  @override
  String toString() {
    return 'Equipamento {Id: $id, Nome: $nome, Local: $local, Cadastrante: $cadastrante}';
  }
}
