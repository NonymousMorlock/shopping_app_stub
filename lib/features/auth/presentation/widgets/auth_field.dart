import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.onSuffixIconPressed,
    super.key,
  });

  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final VoidCallback? onSuffixIconPressed;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.addListener(() {
        setState(() {});
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: widget.controller.text.isEmpty ? Colors.grey : Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: widget.onSuffixIconPressed,
          icon: Icon(
            widget.suffixIcon,
            color: widget.controller.text.isEmpty ? Colors.grey : Colors.black,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
