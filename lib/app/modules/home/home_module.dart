import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/modules/battle/battle_module.dart';
import 'package:valorant_cards_app/app/modules/home/presenter/stores/home_store.dart';

import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/battle', module: BattleModule())
  ];
}
