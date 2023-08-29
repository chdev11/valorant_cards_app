import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  Animate.restartOnHotReload = true;

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
