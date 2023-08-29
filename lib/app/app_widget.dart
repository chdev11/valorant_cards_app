import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          textTheme: GoogleFonts.asapTextTheme(),),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: GoogleFonts.asap().fontFamily,
          colorScheme: const ColorScheme.dark(
            secondary: Colors.white,
          )),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
