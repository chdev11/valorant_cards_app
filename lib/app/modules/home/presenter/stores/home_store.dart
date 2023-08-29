import 'package:mobx/mobx.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/agent.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/utils/mocked_agents.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase() {
    agentList.addAll(agentListMock);
  }

  @observable
  var agentList = ObservableList<Agent>.of([]);
}
