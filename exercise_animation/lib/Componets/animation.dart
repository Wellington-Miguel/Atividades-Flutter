import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationOnboarding extends StatelessWidget {
  AnimationOnboarding({required this.controller, required this.index, Key? key})
      : super(key: key);
  AnimationController controller;
  int index;
  final List<String> animations = [
    'asset/home_amiated.zip',
    'asset/share.zip',
    'asset/complete.zip',
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint(animations[index]);
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: LottieBuilder.asset(
        animations[index],
        controller: controller,
        width: 200,
        height: 200,
      ),
    );
  }
}
