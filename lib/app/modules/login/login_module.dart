import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/modules/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const LoginPage())
  ];
}
