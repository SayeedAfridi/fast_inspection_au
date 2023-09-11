import 'package:flutter/material.dart';

class PageBlock extends StatelessWidget {
  final Widget child;
  const PageBlock({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.purple.shade900.withOpacity(0.5),
      ),
      child: child,
    );
  }
}
