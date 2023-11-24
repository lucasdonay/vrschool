class UpdateCourseRequest {
  final int codigo;
  final String descricao;
  final String ementa;
  final bool? enrollmentsExist;

  UpdateCourseRequest({
    required this.codigo,
    required this.descricao,
    required this.ementa,
    this.enrollmentsExist,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'novaDescricao': descricao,
      'novaEmenta': ementa,
    };
  }
}
