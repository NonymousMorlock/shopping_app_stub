// coverage:ignore-file
import 'package:benaiah_okwukwe_anukem/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return PinCodeTextField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          appContext: context,
          autoFocus: true,
          length: 4,
          dialogConfig: DialogConfig(
            dialogContent: 'Do you want to paste ',
            dialogTitle: 'Paste OTP',
          ),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          pinTheme: PinTheme(
            inactiveColor: const Color(0xFFEEEEEE),
            activeColor: Theme.of(context).primaryColorDark,
            selectedColor: state.accentColour,
            shape: PinCodeFieldShape.box,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 59,
            fieldWidth: 86,
            activeFillColor: const Color(0xFFFAFBFA),
            inactiveFillColor: const Color(0xFFFAFBFA),
          ),
          onChanged: (_) {},
          onCompleted: (pin) {
            controller.text = pin;
          },
          beforeTextPaste: (val) {
            return val != null &&
                val.isNotEmpty &&
                val.length == 4 &&
                int.tryParse(val) != null;
          },
        );
      },
    );
  }
}
