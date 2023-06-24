import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/core_utils.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/auth_field.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/password_reset_successfully_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({required this.email, super.key});

  static const routeName = '/create-new-password';

  final String email;

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColour,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: 16),
              children: [
                Lottie.asset(MediaRes.password),
                const SizedBox(height: 16),
                Text(
                  'Create New Password',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: obscurePassword,
                  prefixIcon: Icons.lock,
                  suffixIcon:
                      !obscurePassword ? Icons.visibility : Icons
                          .visibility_off,
                  onSuffixIconPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 16),
                AuthField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  prefixIcon: Icons.lock,
                  suffixIcon: !obscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIconPressed: () {
                    setState(() {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    });
                  },
                ),
                const SizedBox(height: 40),
                StatefulBuilder(
                  builder: (context, refresh) {
                    passwordController.addListener(() {
                      if (!mounted) return;
                      refresh(() {});
                    });
                    confirmPasswordController.addListener(() {
                      if (!mounted) return;
                      refresh(() {});
                    });
                    return RoundedButton(
                      buttonText: 'Continue',
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) =>
                              const PasswordResetSuccessfullyDialog(),
                        );
                      },
                      onInactivePressed: () {
                        String? message;
                        if (passwordController.text.isEmpty ||
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
                      inactive: confirmPasswordController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          passwordController.text !=
                              confirmPasswordController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
