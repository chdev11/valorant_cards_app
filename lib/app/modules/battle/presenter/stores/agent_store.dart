import 'package:mobx/mobx.dart';
part 'agent_store.g.dart';

class AgentStore = AgentStoreBase with _$AgentStore;

abstract class AgentStoreBase with Store {
  AgentStoreBase([int? health]) {
    if (health != null) {
      this.health = health;
    }
  }

  @observable
  int health = 100;

  @observable
  bool alive = true;

  @observable
  bool battle = false;

  @action
  void increaseHealth(int value) {
    health += value;

    if (health > 0) alive = true;
  }

  @action
  void decreaseHealth(int value) {
    health -= value;

    if (health <= 0) alive = false;
  }

  @action
  void enterBattle() => battle = true;

  @action
  void exitBattle() => battle = false;
}
