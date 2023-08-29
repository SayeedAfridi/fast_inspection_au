import 'package:flutter/material.dart';
import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        useMaterial3: true,
      ),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        useMaterial3: true,
      ),
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
