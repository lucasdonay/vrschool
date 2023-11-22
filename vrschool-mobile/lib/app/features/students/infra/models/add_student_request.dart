class AddAlunoRequest {
  final String nome;

  AddAlunoRequest({required this.nome});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
    };
  }
}
