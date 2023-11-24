import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_student_request.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/update_student_request.dart';
import 'package:vrschool_mobile/app/features/students/infra/repositories/student_repository.dart';

part 'student_store.g.dart';

class AlunosStore = _AlunosStore with _$AlunosStore;

abstract class _AlunosStore with Store {
  final AlunoRepository repository;

  _AlunosStore(this.repository);

  @observable
  ObservableList<AlunoResponse> alunoList = ObservableList<AlunoResponse>();

  @observable
  bool isLoading = false;

  @action
  setAlunoList(List<AlunoResponse> alunos) {
    alunoList.clear();

    for (int i = 0; i < alunos.length; i++) {
      if (alunos[i].cursoDescricao.isEmpty) {
        alunos[i].cursoDescricao = 'NÃO ESTÁ MATRICULADO';
      }

      alunoList.add(alunos[i]);
    }
  }

  @action
  addNewAlunoInList(AlunoResponse alunoResponse) {
    alunoList.add(alunoResponse);

    print(alunoList);
  }

  @action
  updateAlunoInList(AlunoResponse alunoResponse) {
    for (int i = 0; i < alunoList.length; i++) {
      if (alunoList[i].codigo == alunoResponse.codigo) {
        alunoList[i].nome = alunoResponse.nome;
        break;
      }
    }
  }

  @action
  removeAlunoInList(int id) {
    for (int i = 0; i < alunoList.length; i++) {
      if (alunoList[i].codigo == id) {
        alunoList.remove(alunoList[i]);
        break;
      }
    }
  }

  @action
  updateCourseInAluno(int id, String curso) {
    for (int i = 0; i < alunoList.length; i++) {
      if (alunoList[i].codigo == id) {
        alunoList[i].cursoDescricao = curso;
        break;
      }
    }
  }

  @action
  Future<void> add(AddAlunoRequest addAlunoRequest) async {
    isLoading = true;
    try {
      await repository
          .add(addAlunoRequest)
          .onSuccess(addNewAlunoInList)
          .onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> update(UpdateAlunoRequest updateAlunoRequest) async {
    isLoading = true;
    try {
      await repository
          .update(updateAlunoRequest)
          .onSuccess(updateAlunoInList)
          .onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> delete(int id) async {
    isLoading = true;
    try {
      await repository.deleteById(id).onSuccess((success) {
        removeAlunoInList(id);
      }).onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getAll() async {
    isLoading = true;
    try {
      await repository.getAll().onSuccess((success) {
        print("DEU BOM");
        setAlunoList(success);
      }).onFailure((failure) {
        print("DEU RUIM");
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }
}
