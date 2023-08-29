import 'package:valorant_cards_app/app/shared/agent/domain/entities/utils/agent_type.dart';

class Agent {
  final String name;
  final String photo;
  final AgentType agentType;

  Agent({required this.name, required this.photo, required this.agentType});
}
