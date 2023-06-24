// coverage:ignore-file
import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/string_extensions.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/core_utils.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/views/otp_timer.dart';
import 'package:benaiah_okwukwe_anukem/features/auth/presentation/widgets/otp_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({
    required this.email,
    super.key,
  });

  static const routeName = '/email-verification';

  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen>
    with WidgetsBindingObserver {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColour,
          appBar: AppBar(backgroundColor: Colors.transparent),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Code has been sent to ${widget.email.obscureEmail}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  OTPFields(controller: controller),
                  const SizedBox(height: 40),
                  OTPTimer(email: widget.email),
                  const SizedBox(height: 40),
                  StatefulBuilder(
                    builder: (context, refresh) {
                      controller.addListener(() {
                        refresh(() {});
                      });
                      return RoundedButton(
                        inactive: controller.text.isEmpty,
                        buttonText: 'Verify',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            CreateNewPasswordScreen.routeName,
                            arguments: widget.email,
                          );
                        },
                        onInactivePressed: () {
                          if (controller.text.isEmpty) {
                            CoreUtils.showToast(
                              context,
                              toast: const IToast.error(
                                message: 'OTP field cannot be empty',
                                borderRadius: 8,
                              ),
                            );
                          }
                        },
                      );
                    },
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
