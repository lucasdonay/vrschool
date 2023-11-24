import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_enrollment_request.dart';

import 'package:vrschool_mobile/app/features/students/infra/repositories/enrollment_repository.dart';

part 'enrollment_store.g.dart';

class EnrollmentStore = _EnrollmentStore with _$EnrollmentStore;

abstract class _EnrollmentStore with Store {
  final EnrollmentRepository repository;

  _EnrollmentStore(this.repository);

  @observable
  bool isLoading = false;

  @action
  Future<void> add(AddEnrollmentRequest addEnrollmentRequest) async {
    isLoading = true;
    try {
      await repository
          .add(addEnrollmentRequest)
          .onSuccess((success) {})
          .onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> delete(AddEnrollmentRequest addEnrollmentRequest) async {
    isLoading = true;
    try {
      await repository
          .delete(addEnrollmentRequest)
          .onSuccess((success) {})
          .onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }
}
