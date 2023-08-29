// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerStore on PlayerStoreBase, Store {
  late final _$selectedIdsAtom =
      Atom(name: 'PlayerStoreBase.selectedIds', context: context);

  @override
  ObservableList<dynamic> get selectedIds {
    _$selectedIdsAtom.reportRead();
    return super.selectedIds;
  }

  @override
  set selectedIds(ObservableList<dynamic> value) {
    _$selectedIdsAtom.reportWrite(value, super.selectedIds, () {
      super.selectedIds = value;
    });
  }

  late final _$battleAgentListAtom =
      Atom(name: 'PlayerStoreBase.battleAgentList', context: context);

  @override
  ObservableList<BattleAgent> get battleAgentList {
    _$battleAgentListAtom.reportRead();
    return super.battleAgentList;
  }

  @override
  set battleAgentList(ObservableList<BattleAgent> value) {
    _$battleAgentListAtom.reportWrite(value, super.battleAgentList, () {
      super.battleAgentList = value;
    });
  }

  late final _$PlayerStoreBaseActionController =
      ActionController(name: 'PlayerStoreBase', context: context);

  @override
  void addSelectedId(String id) {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.addSelectedId');
    try {
      return super.addSelectedId(id);
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedId(String id) {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.removeSelectedId');
    try {
      return super.removeSelectedId(id);
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBattleAgentList() {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.setBattleAgentList');
    try {
      return super.setBattleAgentList();
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCards() {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.selectCards');
    try {
      return super.selectCards();
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIds: ${selectedIds},
battleAgentList: ${battleAgentList}
    ''';
  }
}
