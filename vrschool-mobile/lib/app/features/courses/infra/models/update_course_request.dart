class UpdateCourseRequest {
  final String codigo;
  final String descricao;

  UpdateCourseRequest({required this.codigo, required this.descricao});

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
    };
  }
}
