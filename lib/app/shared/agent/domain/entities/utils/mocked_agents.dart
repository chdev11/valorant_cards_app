import 'package:valorant_cards_app/app/shared/agent/domain/entities/agent.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/utils/agent_type.dart';
import 'package:valorant_cards_app/app/shared/images.dart';

final agentListMock = [
  brimstoneAgent,
  viperAgent,
  omenAgent,
  killjoyAgent,
  cypherAgent,
  sovaAgent,
  sageAgent,
  phoenixAgent,
  jettAgent,
  reynaAgent,
  razeAgent,
  breachAgent,
  skyeAgent,
  yoruAgent,
  astraAgent,
  kayoAgent,
  chamberAgent,
  neonAgent,
  fadeAgent,
  harborAgent,
  gekkoAgent,
];

final brimstoneAgent = Agent(
    name: 'Brimstone',
    photo: brimstoneAgentImage,
    agentType: AgentType.controller);
final viperAgent = Agent(
    name: 'Viper', photo: viperAgentImage, agentType: AgentType.controller);
final omenAgent =
    Agent(name: 'Omen', photo: omenAgentImage, agentType: AgentType.controller);
final killjoyAgent = Agent(
    name: 'Killjoy', photo: killjoyAgentImage, agentType: AgentType.sentinel);
final cypherAgent = Agent(
    name: 'Cypher', photo: cypherAgentImage, agentType: AgentType.sentinel);
final sovaAgent =
    Agent(name: 'Sova', photo: sovaAgentImage, agentType: AgentType.initiator);
final sageAgent =
    Agent(name: 'Sage', photo: sageAgentImage, agentType: AgentType.sentinel);
final phoenixAgent = Agent(
    name: 'Phoenix', photo: phoenixAgentImage, agentType: AgentType.duelist);
final jettAgent =
    Agent(name: 'Jett', photo: jettAgentImage, agentType: AgentType.duelist);
final reynaAgent =
    Agent(name: 'Reyna', photo: reynaAgentImage, agentType: AgentType.duelist);
final razeAgent =
    Agent(name: 'Raze', photo: razeAgentImage, agentType: AgentType.duelist);
final breachAgent = Agent(
    name: 'Breach', photo: breachAgentImage, agentType: AgentType.initiator);
final skyeAgent =
    Agent(name: 'Skye', photo: skyeAgentImage, agentType: AgentType.initiator);
final yoruAgent =
    Agent(name: 'Yoru', photo: yoruAgentImage, agentType: AgentType.duelist);
final astraAgent = Agent(
    name: 'Astra', photo: astraAgentImage, agentType: AgentType.controller);
final kayoAgent =
    Agent(name: 'KAY/O', photo: kayoAgentImage, agentType: AgentType.initiator);
final chamberAgent = Agent(
    name: 'Chamber', photo: chamberAgentImage, agentType: AgentType.sentinel);
final neonAgent =
    Agent(name: 'Neon', photo: neonAgentImage, agentType: AgentType.duelist);
final fadeAgent =
    Agent(name: 'Fade', photo: fadeAgentImage, agentType: AgentType.initiator);
final harborAgent = Agent(
    name: 'Harbor', photo: harborAgentImage, agentType: AgentType.controller);
final gekkoAgent = Agent(
    name: 'Gekko', photo: gekkoAgentImage, agentType: AgentType.initiator);
