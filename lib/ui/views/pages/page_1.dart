import 'package:fast_inspection/ui/common/app_strings.dart';
import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/widgets/app_page.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:fast_inspection/ui/widgets/page_block.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    return AppPage(children: [
      const PageBlock(
          child: Text(
        address,
        style: TextStyle(
          fontSize: 13,
        ),
      )),
      verticalSpaceSmall,
      PageBlock(
        child: Column(
          children: [
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business Name',
            ),
            verticalSpaceSmall,
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business Address',
            ),
            verticalSpaceSmall,
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business Phone No',
            ),
            verticalSpaceSmall,
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business Email',
            ),
            verticalSpaceSmall,
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business Website',
            ),
            verticalSpaceSmall,
            AppTextField(
              backgroundColor: bg,
              hintText: 'Business logo',
            ),
          ],
        ),
      ),
      verticalSpaceSmall,
      const PageBlock(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Property facade')],
        ),
      ),
    ]);
  }
}
