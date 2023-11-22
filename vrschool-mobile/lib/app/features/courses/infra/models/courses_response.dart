class CoursesResponse {
  final int codigo;
  String descricao;
  String ementa;

  CoursesResponse({
    required this.codigo,
    required this.descricao,
    required this.ementa,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
    };
  }

  factory CoursesResponse.fromMap(Map<String, dynamic> map) {
    return CoursesResponse(
      codigo: (map['codigo'] ?? 0) as int,
      descricao: (map['descricao'] ?? '') as String,
      ementa: (map['ementa'] ?? '') as String,
    );
  }
}
