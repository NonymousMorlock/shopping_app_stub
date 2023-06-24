import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    this.inactive = false,
    this.onPressed,
    this.onInactivePressed,
    this.icon,
    super.key,
  });

  final String buttonText;
  final VoidCallback? onPressed;
  final VoidCallback? onInactivePressed;
  final bool inactive;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: inactive ? onInactivePressed ?? () {} : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                inactive ? state.inactiveColour : state.accentColour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: state.backgroundColour, size: 16),
                const SizedBox(width: 8),
              ],
              Text(
                buttonText,
                style: TextStyle(
                  color: state.backgroundColour,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
