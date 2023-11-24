class UpdateCourseRequest {
  final String codigo;
  final String descricao;
  final String ementa;

  UpdateCourseRequest({required this.codigo, required this.descricao, required this.ementa});

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'novaDescricao': descricao,
      'novaEmenta': ementa,
    };
  }
}
