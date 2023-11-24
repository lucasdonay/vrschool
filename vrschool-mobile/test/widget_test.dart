import 'package:flutter_test/flutter_test.dart';
import 'package:vrschool_mobile/app/features/students/external/student_service.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';
import 'package:vrschool_mobile/app/features/students/infra/repositories/student_repository.dart';
import 'package:vrschool_mobile/app/features/students/presenter/stores/student_store.dart';

void main() {
  group('StudentController', () {
    test('setAlunoList', () {
      final service = AlunosService();
      final repository = AlunoRepository(alunosService: service);
      final controller = AlunosStore(repository);
      final alunoList = controller.alunoList;

      final alunos = [
        AlunoResponse(codigo: 1, nome: "curso A", cursoDescricao: 'Curso 1'),
        AlunoResponse(codigo: 2, nome: "curso B", cursoDescricao: 'Curso 2'),
      ];

      controller.setAlunoList(alunos);

      expect(alunoList, hasLength(2));
      expect(alunoList[0].cursoDescricao, 'Curso 1');
      expect(alunoList[1].nome, 'curso B');
    });
  });
}
