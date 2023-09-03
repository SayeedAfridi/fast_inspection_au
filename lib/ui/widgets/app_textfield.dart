import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
                child: Icon(showPass ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        hintText: widget.hintText,
      ),
      obscureText: widget.isPassword && !showPass,
    );
  }
}
