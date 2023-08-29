import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/modules/battle/presenter/stores/battle_store.dart';
import 'package:valorant_cards_app/app/modules/battle/ui/battle_page.dart';

class BattleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BattleStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const BattlePage())
  ];
}
