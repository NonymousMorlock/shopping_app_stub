import 'package:benaiah_okwukwe_anukem/core/common/widgets/logo.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/core_utils.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/sign_up_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;

  bool visiblePassword = false;

  @override
  void dispose() {
    emailController.removeListener(() {});
    passwordController.removeListener(() {});
    emailController.dispose();
    passwordController.dispose();
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
                    'Login to your account',
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
                    prefixIcon: Icons.lock,
                    obscureText: !visiblePassword,
                    keyboardType: TextInputType.visiblePassword,
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
                  Row(
                    children: [
                      Checkbox(
                        activeColor: state.accentColour,
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      const Text('Remember me'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordScreen.routeName,
                          );
                        },
                        child: const Text('Forgot password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  StatefulBuilder(
                    builder: (context, refresh) {
                      emailController.addListener(() {
                        if (!mounted) return;
                        refresh(() {});
                      });
                      passwordController.addListener(() {
                        if (!mounted) return;
                        refresh(() {});
                      });
                      return RoundedButton(
                        buttonText: 'Sign in',
                        onPressed: () {},
                        onInactivePressed: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            CoreUtils.showToast(
                              context,
                              toast: const IToast.error(
                                message: 'Please fill all fields',
                                borderRadius: 8,
                              ),
                            );
                          }
                        },
                        inactive: emailController.text.isEmpty ||
                            passwordController.text.isEmpty,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: const Text('Sign up'),
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
