import 'package:benaiah_okwukwe_anukem/core/common/widgets/logo.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/core_utils.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/otp_verification_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColour,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shrinkWrap: true,
              children: [
                const Logo(),
                const Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter your email address below to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 50),
                StatefulBuilder(
                  builder: (context, refresh) {
                    emailController.addListener(() {
                      refresh(() {});
                    });
                    return RoundedButton(
                      inactive: emailController.text.isEmpty,
                      buttonText: 'Reset Password',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          OTPVerificationScreen.routeName,
                          arguments: emailController.text.trim(),
                        );
                      },
                      onInactivePressed: () {
                        if (emailController.text.isEmpty) {
                          CoreUtils.showToast(
                            context,
                            toast: const IToast.error(
                              message: 'Email cannot be empty',
                              borderRadius: 8,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
