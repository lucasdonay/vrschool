class UpdateAlunoRequest {
  final int id;
  final String name;

  UpdateAlunoRequest({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'novoNome': name,
    };
  }
}