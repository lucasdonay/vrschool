class AddCourseRequest {
  final String descricao;
  final String ementa;

  AddCourseRequest({required this.descricao, required this.ementa});

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'ementa': ementa,
    };
  }
}
