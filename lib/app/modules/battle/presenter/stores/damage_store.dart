import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:valorant_cards_app/app/modules/battle/utils/entities/battle_agent.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/agent.dart';
import 'package:valorant_cards_app/app/shared/agent/domain/entities/utils/agent_type.dart';
part 'damage_store.g.dart';

class DamageStore = DamageStoreBase with _$DamageStore;

abstract class DamageStoreBase with Store {
  Map calculate(
    List<BattleAgent> agentList,
    List<BattleAgent> agentListEnemy,
  ) {
    int aTeamAttack = 0;
    int aTeamDefence = 0;
    int aTeamStun = 0;
    int aTeamFlash = 0;
    int aTeamHealth = 0;

    int dTeamAttack = 0;
    int dTeamDefence = 0;
    int dTeamStun = 0;
    int dTeamFlash = 0;
    int dTeamHealth = 0;

    for (var agent in agentList) {
      final attack = calculateAttack(agent);
      final defence = calculateDefence(agent);
      final stun = calculateStun(agent);
      final flash = calculateFlash(agent);
      final health = calculateHealth(agent);

      aTeamAttack += attack;
      aTeamDefence += defence;
      aTeamStun += stun;
      aTeamFlash += flash;
      aTeamHealth += health;
    }
    for (var agent in agentListEnemy) {
      final attack = calculateAttack(agent);
      final defence = calculateDefence(agent);
      final stun = calculateStun(agent);
      final flash = calculateFlash(agent);
      final health = calculateHealth(agent);

      dTeamAttack += attack;
      dTeamDefence += defence;
      dTeamStun += stun;
      dTeamFlash += flash;
      dTeamHealth += health;
    }

    print(
        'COMP: ${agentList.map((e) => e.name).toList().join(', ')} x ${agentListEnemy.map((e) => e.name).toList().join(', ')}');

    if (aTeamAttack == dTeamAttack) {
      print('ATAQUE: Empate! ($aTeamAttack - $dTeamAttack)');
    } else {
      print(
          'ATAQUE: Time ${aTeamAttack > dTeamAttack ? 'atacante' : 'defensor'} ganhou! ($aTeamAttack - $dTeamAttack)');
    }
    if (aTeamDefence == dTeamDefence) {
      print('DEFESA: Empate! ($aTeamDefence - $dTeamDefence)');
    } else {
      print(
          'DEFESA: Time ${aTeamDefence > dTeamDefence ? 'atacante' : 'defensor'} ganhou! ($aTeamDefence - $dTeamDefence)');
    }
    if (aTeamStun == dTeamStun) {
      print('STUN: Empate! ($aTeamStun - $dTeamStun)');
    } else {
      print(
          'STUN: Time ${aTeamStun > dTeamStun ? 'atacante' : 'defensor'} ganhou! ($aTeamStun - $dTeamStun)');
    }
    if (aTeamFlash == dTeamFlash) {
      print('FLASH: Empate! ($aTeamFlash - $dTeamFlash)');
    } else {
      print(
          'FLASH: Time ${aTeamFlash > dTeamFlash ? 'atacante' : 'defensor'} ganhou! ($aTeamFlash - $dTeamFlash)');
    }
    if (aTeamHealth == dTeamHealth) {
      print('CURA: Empate! ($aTeamHealth - $dTeamHealth)');
    } else {
      print(
          'CURA: Time ${aTeamHealth > dTeamHealth ? 'atacante' : 'defensor'} ganhou! ($aTeamHealth - $dTeamHealth)');
    }

    final aTeamDamage =
        dTeamAttack - (aTeamDefence + (aTeamHealth * .4)).toInt();
    final dTeamDamage =
        aTeamAttack - (dTeamDefence + (dTeamHealth * .4)).toInt();

    if (!aTeamDamage.isNegative) {
      final aTeamDamageParcel = aTeamDamage ~/ agentList.length;
      for (var agent in agentList) {
        agent.store.decreaseHealth(aTeamDamageParcel);
      }
    }

    if (!dTeamDamage.isNegative) {
      final dTeamDamageParcel = dTeamDamage ~/ agentListEnemy.length;
      for (var agent in agentListEnemy) {
        agent.store.decreaseHealth(dTeamDamageParcel);
      }
    }

    return {
      'aTeam': {
        'attack': aTeamAttack,
        'defence': aTeamDefence,
        'stun': aTeamStun,
        'flash': aTeamFlash,
        'health': aTeamHealth,
      },
      'bTeam': {
        'attack': dTeamAttack,
        'defence': dTeamDefence,
        'stun': dTeamStun,
        'flash': dTeamFlash,
        'health': dTeamHealth,
      }
    };
  }

  int calculateAttack(Agent agent) {
    int result = 0;

    switch (agent.agentType) {
      case AgentType.controller:
        result = random(25, 40);
        break;
      case AgentType.duelist:
        result = random(60, 75);
        break;
      case AgentType.initiator:
        result = random(45, 60);
        break;
      case AgentType.sentinel:
        result = random(35, 50);
        break;
    }

    return result;
  }

  int calculateDefence(Agent agent) {
    int result = 0;

    switch (agent.agentType) {
      case AgentType.controller:
        result = random(60, 70);
        break;
      case AgentType.duelist:
        result = random(30, 55);
        break;
      case AgentType.initiator:
        result = random(40, 60);
        break;
      case AgentType.sentinel:
        result = random(60, 75);
        break;
    }

    return result;
  }

  int calculateStun(Agent agent) {
    int result = 0;

    switch (agent.agentType) {
      case AgentType.controller:
        result = random(50, 60);
        break;
      case AgentType.duelist:
        result = 0;
        break;
      case AgentType.initiator:
        result = random(60, 75);
        break;
      case AgentType.sentinel:
        result = random(35, 40);
        break;
    }

    return result;
  }

  int calculateFlash(Agent agent) {
    int result = 0;

    switch (agent.agentType) {
      case AgentType.controller:
        result = random(60, 70);
        break;
      case AgentType.duelist:
        result = random(10, 40);
        break;
      case AgentType.initiator:
        result = random(55, 65);
        break;
      case AgentType.sentinel:
        result = 0;
        break;
    }

    return result;
  }

  int calculateHealth(Agent agent) {
    int result = 0;

    switch (agent.agentType) {
      case AgentType.controller:
        result = 0;
        break;
      case AgentType.duelist:
        result = 0;
        break;
      case AgentType.initiator:
        result = random(15, 25);
        break;
      case AgentType.sentinel:
        result = random(35, 50);
        break;
    }

    return result;
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
