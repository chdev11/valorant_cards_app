import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/player_store.dart';
import 'package:valorant_cards_app/app/modules/battle/utils/battle_card_widget.dart';

class DeckWidget extends StatelessWidget {
  final PlayerStore store;

  const DeckWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: List.generate(
            store.battleAgentList
                .where((element) => element.store.battle)
                .toList()
                .length, (index) {
          final filteredAgents = store.battleAgentList
              .where((element) => element.store.battle)
              .map((e) => e)
              .toList();
          final battleAgent = filteredAgents[index];
          return Positioned(
            left: index.toDouble(),
            child: BattleCardWidget(agent: battleAgent),
          )
              .animate(
                  delay: Duration(
                      milliseconds: 100 * (filteredAgents.length - index)))
              .moveX(
                duration: const Duration(seconds: 1),
                begin: (15 * index).toDouble(),
                end: (60 * index).toDouble(),
              );
        }),
      ),
    );
  }
}
