import 'package:mobx/mobx.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/states/battle_state.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/damage_store.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/player_store.dart';
part 'battle_store.g.dart';

class BattleStore = BattleStoreBase with _$BattleStore;

abstract class BattleStoreBase with Store {
  final p1Store = PlayerStore();
  final p2Store = PlayerStore(true);
  final damageStore = DamageStore();

  @observable
  IBattleState battleState = BattleReady();

  @observable
  bool endedRoundBlur = false;

  @action
  void toggleEndedRoundBlur() => endedRoundBlur = !endedRoundBlur;

  @action
  void initGame() {
    battleState = BattleSelection();
  }

  @action
  void initBattle() {
    battleState = BattleP1Choice();
  }

  @action
  void changeSideBattle() {
    if (battleState is BattleP1Choice) {
      battleState = BattleP2Choice();

      if (p2Store.robot!) {
        Future.delayed(const Duration(seconds: 2), () {
          p2Store.selectCards();
          battleState = BattleGame();
        });
      }
    } else {
      battleState = BattleGame();
    }
  }

  @action
  void endBattle(String message) {
    battleState = BattleEnd(message);
  }
}
