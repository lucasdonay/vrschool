// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationController on NavigationControllerBase, Store {
  late final _$selectedBottomBarIndexAtom = Atom(
      name: 'NavigationControllerBase.selectedBottomBarIndex',
      context: context);

  @override
  int get selectedBottomBarIndex {
    _$selectedBottomBarIndexAtom.reportRead();
    return super.selectedBottomBarIndex;
  }

  @override
  set selectedBottomBarIndex(int value) {
    _$selectedBottomBarIndexAtom
        .reportWrite(value, super.selectedBottomBarIndex, () {
      super.selectedBottomBarIndex = value;
    });
  }

  late final _$NavigationControllerBaseActionController =
      ActionController(name: 'NavigationControllerBase', context: context);

  @override
  dynamic onItemTapped(int index) {
    final _$actionInfo = _$NavigationControllerBaseActionController.startAction(
        name: 'NavigationControllerBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$NavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBottomBarIndex: ${selectedBottomBarIndex}
    ''';
  }
}
