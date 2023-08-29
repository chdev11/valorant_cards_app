import 'package:flutter/material.dart';

class ChoiceWidget extends StatelessWidget {
  final String image;
  final String label;

  const ChoiceWidget({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * .5,
      width: size.width * .5,
      child: Card(
        color: const Color.fromARGB(255, 27, 27, 27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 100,
            ),
            const SizedBox(height: 15),
            Text(label),
          ],
        ),
      ),
    );
  }
}
