import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/modules/home/presenter/stores/home_store.dart';
import 'package:valorant_cards_app/app/modules/battle/utils/entities/battle_agent.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/agent_store.dart';
part 'player_store.g.dart';

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  bool? robot;

  PlayerStoreBase([this.robot = false]) {
    if (robot!) {
      final random = Random();

      for (int i = 0; i < 5; i++) {
        final agent =
            homeStore.agentList[random.nextInt(homeStore.agentList.length)];

        if (selectedIds.indexWhere((element) => element == agent.name) >= 0 ||
            selectedIds.length == 5) {
          i--;
          continue;
        }

        selectedIds.add(agent.name);
      }

      setBattleAgentList();
    }
  }

  final homeStore = Modular.get<HomeStore>();

  // SELECTION AGENTS

  @observable
  ObservableList selectedIds = ObservableList<String>.of([]);

  @action
  void addSelectedId(String id) {
    if (selectedIds.length == 5) return;
    selectedIds.add(id);
  }

  @action
  void removeSelectedId(String id) =>
      selectedIds.removeWhere((element) => element == id);

  // BATTLE FINAL AGENTS

  @observable
  var battleAgentList = ObservableList<BattleAgent>.of([]);

  @action
  void setBattleAgentList() {
    battleAgentList.addAll(selectedIds.map((e) {
      return BattleAgent.fromAgent(
        homeStore.agentList.firstWhere((element) => element.name == e),
        store: AgentStore(),
      );
    }));
    selectedIds.clear();
  }

  // ROBOT CONFIG

  @action
  void selectCards() {
    try {
      final aliveLength = battleAgentList
          .where((element) => element.store.alive)
          .toList()
          .length;

      final cards = aliveLength > 1 ? randomNum(1, aliveLength) : 1;

      for (int i = 0; i < cards; i++) {
        final agent =
            battleAgentList.where((element) => element.store.alive).toList()[
                Random().nextInt(battleAgentList
                    .where((element) => element.store.alive)
                    .length)];

        if (agent.store.battle) {
          i--;
          continue;
        }

        agent.store.enterBattle();
      }
    } catch (_) {}
  }

  int randomNum(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
