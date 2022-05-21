import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ButtonNext extends StatelessWidget {
  ButtonNext({required this.buttonController, Key? key}) : super(key: key);
  AnimationController buttonController;
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.network(
      'https://assets2.lottiefiles.com/packages/lf20_yjbzqbqb.json',
      width: 50,
      height: 50,
    );
  }
}
