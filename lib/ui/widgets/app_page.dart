import 'package:fast_inspection/ui/common/app_strings.dart';
import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/widgets/page_block.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  final List<Widget> children;
  const AppPage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageBlock(
                child: Text(
                  disclaimer,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              verticalSpaceSmall,
              ...children
            ],
          ),
        ),
      ),
    );
  }
}
