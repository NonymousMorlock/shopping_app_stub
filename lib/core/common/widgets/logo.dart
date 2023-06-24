import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'animated_logo',
      child: Lottie.asset(MediaRes.animatedLogo, height: 200),
    );
  }
}
