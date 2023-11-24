class UpdateAlunoRequest {
  final String id;
  final String name;

  UpdateAlunoRequest({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
