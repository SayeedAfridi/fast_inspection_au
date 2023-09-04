import 'package:fast_inspection/firebase_options.dart';
import 'package:fast_inspection/ui/common/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
