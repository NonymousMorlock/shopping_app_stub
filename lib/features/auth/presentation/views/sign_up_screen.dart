import 'package:benaiah_okwukwe_anukem/core/common/widgets/logo.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/core_utils.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/login_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/create-account';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  @override
  void dispose() {
    emailController.removeListener(() {});
    passwordController.removeListener(() {});
    confirmPasswordController.removeListener(() {});
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColour,
          body: SafeArea(
            child: Center(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shrinkWrap: true,
                children: [
                  const Logo(),
                  const Text(
                    'Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: !visiblePassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: visiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onSuffixIconPressed: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                    obscureText: !visibleConfirmPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: visibleConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onSuffixIconPressed: () {
                      setState(() {
                        visibleConfirmPassword = !visibleConfirmPassword;
                      });
                    },
                  ),
                  const SizedBox(height: 50),
                  StatefulBuilder(
                    builder: (context, refresh) {
                      emailController.addListener(() {
                        refresh(() {});
                      });
                      passwordController.addListener(() {
                        refresh(() {});
                      });
                      confirmPasswordController.addListener(() {
                        refresh(() {});
                      });
                      return RoundedButton(
                        inactive: emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty ||
                            passwordController.text !=
                                confirmPasswordController.text,
                        buttonText: 'Create Account',
                        onPressed: () {},
                        onInactivePressed: () {
                          String? message;
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty) {
                            message = 'Please fill all fields';
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            message = 'Passwords do not match';
                          }
                          if (message != null) {
                            CoreUtils.showToast(
                              context,
                              toast: IToast.error(
                                message: message,
                                borderRadius: 8,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
