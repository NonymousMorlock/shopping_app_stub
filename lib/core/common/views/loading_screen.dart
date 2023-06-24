import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key}) : _isDialog = false;

  const LoadingScreen.dialog({super.key}) : _isDialog = true;

  final bool _isDialog;

  @override
  Widget build(BuildContext context) {
    return _isDialog
        ? Center(
          child: Lottie.asset(MediaRes.loading),
        )
        : Scaffold(
            body: Center(
              child: Lottie.asset(MediaRes.loading),
            ),
          );
  }
}
