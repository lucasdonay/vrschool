class AddAlunoRequest {
  final String name;

  AddAlunoRequest({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}