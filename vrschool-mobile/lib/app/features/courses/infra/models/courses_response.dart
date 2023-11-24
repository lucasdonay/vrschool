class CoursesResponse {
  final int codigo;
  String descricao;
  String ementa;
  bool enrollmentsExist;

  CoursesResponse({
    required this.codigo,
    required this.descricao,
    required this.ementa,
    required this.enrollmentsExist,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
      'enrollmentsExist': enrollmentsExist
    };
  }

  factory CoursesResponse.fromMap(Map<String, dynamic> map) {
    return CoursesResponse(
      codigo: (map['codigo'] ?? 0) as int,
      descricao: (map['descricao'] ?? '') as String,
      ementa: (map['ementa'] ?? '') as String,
      enrollmentsExist: (map['enrollmentsExist'] ?? '') as bool,
    );
  }
}
