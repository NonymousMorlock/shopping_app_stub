import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PasswordResetSuccessfullyDialog extends StatelessWidget {
  const PasswordResetSuccessfullyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(MediaRes.successConfetti, repeat: false),
            const Text(
              'Password Reset Successfully',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your password has been reset successfully. You can now login '
              'with your new password.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
