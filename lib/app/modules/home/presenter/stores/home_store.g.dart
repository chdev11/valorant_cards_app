// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$agentListAtom =
      Atom(name: 'HomeStoreBase.agentList', context: context);

  @override
  ObservableList<Agent> get agentList {
    _$agentListAtom.reportRead();
    return super.agentList;
  }

  @override
  set agentList(ObservableList<Agent> value) {
    _$agentListAtom.reportWrite(value, super.agentList, () {
      super.agentList = value;
    });
  }

  @override
  String toString() {
    return '''
agentList: ${agentList}
    ''';
  }
}
