import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valorant_cards_app/app/shared/constants.dart';
import 'package:valorant_cards_app/app/shared/images.dart';
import 'package:valorant_cards_app/app/shared/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(size.width * .1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Center(child: Image.asset(kunaiImage, width: 100))
                            .floating(),
                        const Text(
                          'Valorant Cards',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: size.height * .02),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            prefixIcon: Icons.person,
                            iconColor: mainColor,
                            maxLines: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            prefixIcon: Icons.password,
                            iconColor: mainColor,
                            obscureText: true,
                            maxLines: 1,
                          ),
                        ),
                        const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Modular.to.pushReplacementNamed('/home/'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Text('LOGIN',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension on Widget {
  floating() {
    return animate()
        .fade(duration: const Duration(seconds: 1))
        .then()
        .animate(onComplete: (controller) => controller.repeat())
        .moveY(begin: -25, end: 0, duration: const Duration(seconds: 1))
        .then()
        .moveY(begin: 0, end: -25, duration: const Duration(seconds: 1))
        .animate(onComplete: (controller) => controller.repeat())
        .shimmer(delay: const Duration(seconds: 5));
  }
}
