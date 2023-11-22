// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunosStore on _AlunosStore, Store {
  late final _$alunoListAtom =
      Atom(name: '_AlunosStore.alunoList', context: context);

  @override
  ObservableList<AlunoResponse> get alunoList {
    _$alunoListAtom.reportRead();
    return super.alunoList;
  }

  @override
  set alunoList(ObservableList<AlunoResponse> value) {
    _$alunoListAtom.reportWrite(value, super.alunoList, () {
      super.alunoList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AlunosStore.isLoading', context: context);

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
      AsyncAction('_AlunosStore.add', context: context);

  @override
  Future<void> add(AddAlunoRequest addAlunoRequest) {
    return _$addAsyncAction.run(() => super.add(addAlunoRequest));
  }

  late final _$updateAsyncAction =
      AsyncAction('_AlunosStore.update', context: context);

  @override
  Future<void> update(UpdateAlunoRequest updateAlunoRequest) {
    return _$updateAsyncAction.run(() => super.update(updateAlunoRequest));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_AlunosStore.delete', context: context);

  @override
  Future<void> delete(int index) {
    return _$deleteAsyncAction.run(() => super.delete(index));
  }

  late final _$getAllAsyncAction =
      AsyncAction('_AlunosStore.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$_AlunosStoreActionController =
      ActionController(name: '_AlunosStore', context: context);

  @override
  dynamic setAlunoList(List<AlunoResponse> alunos) {
    final _$actionInfo = _$_AlunosStoreActionController.startAction(
        name: '_AlunosStore.setAlunoList');
    try {
      return super.setAlunoList(alunos);
    } finally {
      _$_AlunosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNewAlunoInList(AlunoResponse alunoResponse) {
    final _$actionInfo = _$_AlunosStoreActionController.startAction(
        name: '_AlunosStore.addNewAlunoInList');
    try {
      return super.addNewAlunoInList(alunoResponse);
    } finally {
      _$_AlunosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateAlunoInList(AlunoResponse alunoResponse) {
    final _$actionInfo = _$_AlunosStoreActionController.startAction(
        name: '_AlunosStore.updateAlunoInList');
    try {
      return super.updateAlunoInList(alunoResponse);
    } finally {
      _$_AlunosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alunoList: ${alunoList},
isLoading: ${isLoading}
    ''';
  }
}
