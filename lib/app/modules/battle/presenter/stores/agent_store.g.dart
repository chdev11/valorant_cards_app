// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgentStore on AgentStoreBase, Store {
  late final _$healthAtom =
      Atom(name: 'AgentStoreBase.health', context: context);

  @override
  int get health {
    _$healthAtom.reportRead();
    return super.health;
  }

  @override
  set health(int value) {
    _$healthAtom.reportWrite(value, super.health, () {
      super.health = value;
    });
  }

  late final _$aliveAtom = Atom(name: 'AgentStoreBase.alive', context: context);

  @override
  bool get alive {
    _$aliveAtom.reportRead();
    return super.alive;
  }

  @override
  set alive(bool value) {
    _$aliveAtom.reportWrite(value, super.alive, () {
      super.alive = value;
    });
  }

  late final _$battleAtom =
      Atom(name: 'AgentStoreBase.battle', context: context);

  @override
  bool get battle {
    _$battleAtom.reportRead();
    return super.battle;
  }

  @override
  set battle(bool value) {
    _$battleAtom.reportWrite(value, super.battle, () {
      super.battle = value;
    });
  }

  late final _$AgentStoreBaseActionController =
      ActionController(name: 'AgentStoreBase', context: context);

  @override
  void increaseHealth(int value) {
    final _$actionInfo = _$AgentStoreBaseActionController.startAction(
        name: 'AgentStoreBase.increaseHealth');
    try {
      return super.increaseHealth(value);
    } finally {
      _$AgentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseHealth(int value) {
    final _$actionInfo = _$AgentStoreBaseActionController.startAction(
        name: 'AgentStoreBase.decreaseHealth');
    try {
      return super.decreaseHealth(value);
    } finally {
      _$AgentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enterBattle() {
    final _$actionInfo = _$AgentStoreBaseActionController.startAction(
        name: 'AgentStoreBase.enterBattle');
    try {
      return super.enterBattle();
    } finally {
      _$AgentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void exitBattle() {
    final _$actionInfo = _$AgentStoreBaseActionController.startAction(
        name: 'AgentStoreBase.exitBattle');
    try {
      return super.exitBattle();
    } finally {
      _$AgentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
health: ${health},
alive: ${alive},
battle: ${battle}
    ''';
  }
}
