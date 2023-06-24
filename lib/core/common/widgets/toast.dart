import 'package:flutter/material.dart';

class IToast extends StatelessWidget {
  const IToast({
    required this.message,
    this.borderRadius,
    this.colour,
    this.textColour,
    this.icon,
    super.key,
  });
  
  const IToast.error({
    required this.message,
    this.borderRadius = 25,
    this.colour = Colors.red,
    this.textColour = Colors.white,
    this.icon = const Icon(Icons.error, color: Colors.white),
    super.key,
  });
  
  const IToast.success({
    required this.message,
    this.borderRadius = 25,
    this.colour = Colors.green,
    this.textColour = Colors.white,
    this.icon = const Icon(Icons.check, color: Colors.white),
    super.key,
  });
  
  const IToast.info({
    required this.message,
    this.borderRadius = 25,
    this.colour = Colors.blue,
    this.textColour = Colors.white,
    this.icon = const Icon(Icons.info, color: Colors.white),
    super.key,
  });
  
  const IToast.warning({
    required this.message,
    this.borderRadius = 25,
    this.colour = Colors.orange,
    this.textColour = Colors.white,
    this.icon = const Icon(Icons.warning, color: Colors.white),
    super.key,
  });

  final double? borderRadius;
  final Color? colour;
  final Color? textColour;
  final Widget? icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 25),
        color: colour ?? Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const Icon(Icons.check),
          const SizedBox(
            width: 12,
          ),
          Text(message, style: TextStyle(color: textColour ?? Colors.white)),
        ],
      ),
    );
  }
}
