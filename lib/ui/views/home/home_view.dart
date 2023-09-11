import 'package:fast_inspection/ui/common/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            onTap: viewModel.setIndex,
            tabs: pages
                .map(
                  (e) => Tab(
                    child: Text(e.title),
                  ),
                )
                .toList(),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/icons/logo_512.png',
                  height: 48,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fast Inspection',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Inspection made easy',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: pages.map((e) => e.widget).toList(),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
