import 'package:valorant_cards_app/app/shared/images.dart';

enum AgentType {
  controller(
    image: controllerTypeImage,
    label: 'Controlador',
    attackStars: 2,
    defenceStars: 4.5,
    stunStars: 3.5,
    flashStars: 3,
    healthStars: 0,
  ),
  duelist(
    image: duelistTypeImage,
    label: 'Duelista',
    attackStars: 5,
    defenceStars: 3,
    stunStars: 0,
    flashStars: 2.5,
    healthStars: 0,
  ),
  initiator(
    image: initiatorTypeImage,
    label: 'Iniciador',
    attackStars: 4,
    defenceStars: 3.5,
    stunStars: 4.5,
    flashStars: 4,
    healthStars: 2,
  ),
  sentinel(
    image: sentinelTypeImage,
    label: 'Sentinela',
    attackStars: 2.5,
    defenceStars: 5,
    stunStars: 2,
    flashStars: 0,
    healthStars: 3.5,
  );

  final String image;
  final String label;
  final double attackStars;
  final double defenceStars;
  final double stunStars;
  final double flashStars;
  final double healthStars;
  const AgentType({
    required this.image,
    required this.label,
    required this.attackStars,
    required this.defenceStars,
    required this.stunStars,
    required this.flashStars,
    required this.healthStars,
  });
}
