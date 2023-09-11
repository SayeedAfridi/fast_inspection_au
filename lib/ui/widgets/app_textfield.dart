import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Color? backgroundColor;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.backgroundColor,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  child:
                      Icon(showPass ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          hintText: widget.hintText,
        ),
        obscureText: widget.isPassword && !showPass,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
      ),
    );
  }
}
