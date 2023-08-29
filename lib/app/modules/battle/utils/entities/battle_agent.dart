import 'package:valorant_cards_app/app/modules/battle/presenter/stores/agent_store.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/agent.dart';

class BattleAgent extends Agent {
  final AgentStore store;

  BattleAgent({
    required super.name,
    required super.photo,
    required super.agentType,
    required this.store,
  });

  factory BattleAgent.fromAgent(Agent agent, {required AgentStore store}) {
    return BattleAgent(
      name: agent.name,
      photo: agent.photo,
      agentType: agent.agentType,
      store: store,
    );
  }
}
