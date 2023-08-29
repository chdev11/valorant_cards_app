import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/modules/battle/utils/choice_widget.dart';
import 'package:valorant_cards_app/app/shared/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ChoiceWidget(image: cardsImage, label: 'Minhas cartas'),
              GestureDetector(
                  onTap: () => Modular.to.pushNamed('/home/battle/'),
                  child: const ChoiceWidget(
                      image: versusImage, label: 'Campo de Batalha')),
            ],
          ),
        ),
      ),
    );
  }
}
