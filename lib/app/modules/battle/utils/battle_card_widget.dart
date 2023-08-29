import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:valorant_cards_app/app/modules/battle/utils/entities/battle_agent.dart';
import 'package:valorant_cards_app/app/shared/images.dart';

class BattleCardWidget extends StatelessWidget {
  final BattleAgent agent;
  final bool large;

  const BattleCardWidget({
    super.key,
    required this.agent,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Observer(builder: (context) {
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              height: large ? null : 160,
              width: large ? null : 100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          agent.agentType.image,
                          width: large ? 30 : 15,
                          color: Colors.black,
                        ),
                        Image.asset(valorantLogoImage, width: large ? 30 : 15),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(agent.photo, height: large ? 160 : 100),
                        LinearPercentIndicator(
                          lineHeight: 6,
                          percent: (agent.store.health / 100).clamp(0, 1),
                          backgroundColor: Colors.white,
                          progressColor: Colors.blue,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          agent.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: large ? 20 : null),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (!agent.store.alive)
              Container(
                height: large ? null : 160,
                width: large ? null : 100,
                color: Colors.black.withOpacity(.9),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.skull,
                    color: Colors.redAccent,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
