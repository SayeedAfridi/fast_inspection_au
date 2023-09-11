import 'package:fast_inspection/ui/views/pages/pages.dart';
import 'package:flutter/material.dart';

class Page {
  final String title;
  final int position;
  final Widget widget;

  const Page({
    required this.title,
    required this.position,
    this.widget = const Page1(),
  });
}

const List<Page> pages = [
  Page(title: 'Page 1', position: 0, widget: Page1()),
  Page(title: 'Page 2', position: 1, widget: Page2()),
  Page(title: 'Page 3', position: 2),
  Page(title: 'Page 4', position: 3),
  Page(title: 'Page 5', position: 4),
  Page(title: 'Page 6', position: 5),
  Page(title: 'Page 7', position: 6),
  Page(title: 'Page 8', position: 7),
  Page(title: 'Page 9', position: 8),
];
