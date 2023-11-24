class CoursesResponse {
  final int codigo;
  String descricao;
  String ementa;
  bool existsMatriculas;

  CoursesResponse({
    required this.codigo,
    required this.descricao,
    required this.ementa,
    required this.existsMatriculas,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
      'existsMatriculas': existsMatriculas
    };
  }

  factory CoursesResponse.fromMap(Map<String, dynamic> map) {
    return CoursesResponse(
      codigo: (map['codigo'] ?? 0) as int,
      descricao: (map['descricao'] ?? '') as String,
      ementa: (map['ementa'] ?? '') as String,
      existsMatriculas: (map['existsMatriculas'] ?? '') as bool,
    );
  }
}
