// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BattleStore on BattleStoreBase, Store {
  late final _$battleStateAtom =
      Atom(name: 'BattleStoreBase.battleState', context: context);

  @override
  IBattleState get battleState {
    _$battleStateAtom.reportRead();
    return super.battleState;
  }

  @override
  set battleState(IBattleState value) {
    _$battleStateAtom.reportWrite(value, super.battleState, () {
      super.battleState = value;
    });
  }

  late final _$endedRoundBlurAtom =
      Atom(name: 'BattleStoreBase.endedRoundBlur', context: context);

  @override
  bool get endedRoundBlur {
    _$endedRoundBlurAtom.reportRead();
    return super.endedRoundBlur;
  }

  @override
  set endedRoundBlur(bool value) {
    _$endedRoundBlurAtom.reportWrite(value, super.endedRoundBlur, () {
      super.endedRoundBlur = value;
    });
  }

  late final _$BattleStoreBaseActionController =
      ActionController(name: 'BattleStoreBase', context: context);

  @override
  void toggleEndedRoundBlur() {
    final _$actionInfo = _$BattleStoreBaseActionController.startAction(
        name: 'BattleStoreBase.toggleEndedRoundBlur');
    try {
      return super.toggleEndedRoundBlur();
    } finally {
      _$BattleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initGame() {
    final _$actionInfo = _$BattleStoreBaseActionController.startAction(
        name: 'BattleStoreBase.initGame');
    try {
      return super.initGame();
    } finally {
      _$BattleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initBattle() {
    final _$actionInfo = _$BattleStoreBaseActionController.startAction(
        name: 'BattleStoreBase.initBattle');
    try {
      return super.initBattle();
    } finally {
      _$BattleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSideBattle() {
    final _$actionInfo = _$BattleStoreBaseActionController.startAction(
        name: 'BattleStoreBase.changeSideBattle');
    try {
      return super.changeSideBattle();
    } finally {
      _$BattleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endBattle(String message) {
    final _$actionInfo = _$BattleStoreBaseActionController.startAction(
        name: 'BattleStoreBase.endBattle');
    try {
      return super.endBattle(message);
    } finally {
      _$BattleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
battleState: ${battleState},
endedRoundBlur: ${endedRoundBlur}
    ''';
  }
}
