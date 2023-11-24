// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnrollmentStore on _EnrollmentStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EnrollmentStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('_EnrollmentStore.add', context: context);

  @override
  Future<void> add(AddEnrollmentRequest addEnrollmentRequest) {
    return _$addAsyncAction.run(() => super.add(addEnrollmentRequest));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_EnrollmentStore.delete', context: context);

  @override
  Future<void> delete(AddEnrollmentRequest addEnrollmentRequest) {
    return _$deleteAsyncAction.run(() => super.delete(addEnrollmentRequest));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
