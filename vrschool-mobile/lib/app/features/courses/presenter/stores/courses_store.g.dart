// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoursesStore on _CoursesStore, Store {
  late final _$coursesListAtom =
      Atom(name: '_CoursesStore.coursesList', context: context);

  @override
  ObservableList<CoursesResponse> get coursesList {
    _$coursesListAtom.reportRead();
    return super.coursesList;
  }

  @override
  set coursesList(ObservableList<CoursesResponse> value) {
    _$coursesListAtom.reportWrite(value, super.coursesList, () {
      super.coursesList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CoursesStore.isLoading', context: context);

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
      AsyncAction('_CoursesStore.add', context: context);

  @override
  Future<void> add(AddCourseRequest addCourseRequest) {
    return _$addAsyncAction.run(() => super.add(addCourseRequest));
  }

  late final _$updateAsyncAction =
      AsyncAction('_CoursesStore.update', context: context);

  @override
  Future<void> update(UpdateCourseRequest updateCourseRequest) {
    return _$updateAsyncAction.run(() => super.update(updateCourseRequest));
  }

  late final _$getAllAsyncAction =
      AsyncAction('_CoursesStore.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_CoursesStore.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$_CoursesStoreActionController =
      ActionController(name: '_CoursesStore', context: context);

  @override
  dynamic setCourseList(List<CoursesResponse> courses) {
    final _$actionInfo = _$_CoursesStoreActionController.startAction(
        name: '_CoursesStore.setCourseList');
    try {
      return super.setCourseList(courses);
    } finally {
      _$_CoursesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNewCourseInList(CoursesResponse courseResponse) {
    final _$actionInfo = _$_CoursesStoreActionController.startAction(
        name: '_CoursesStore.addNewCourseInList');
    try {
      return super.addNewCourseInList(courseResponse);
    } finally {
      _$_CoursesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCourseInList(CoursesResponse courseResponse) {
    final _$actionInfo = _$_CoursesStoreActionController.startAction(
        name: '_CoursesStore.updateCourseInList');
    try {
      return super.updateCourseInList(courseResponse);
    } finally {
      _$_CoursesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCourseInList(int id) {
    final _$actionInfo = _$_CoursesStoreActionController.startAction(
        name: '_CoursesStore.removeCourseInList');
    try {
      return super.removeCourseInList(id);
    } finally {
      _$_CoursesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coursesList: ${coursesList},
isLoading: ${isLoading}
    ''';
  }
}
