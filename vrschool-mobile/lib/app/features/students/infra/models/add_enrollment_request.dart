class AddEnrollmentRequest {
  int codigoStudent;
  int? idCourse;

  AddEnrollmentRequest({required this.codigoStudent, this.idCourse});

  Map<String, dynamic> toJson() {
    return {
      'codigoAluno': codigoStudent,
      'codigoCurso': idCourse,
    };
  }
}
