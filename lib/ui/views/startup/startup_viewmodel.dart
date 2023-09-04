import 'package:fast_inspection/api/firestore_api.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firestore = locator<FirestoreApi>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    FlutterNativeSplash.remove();
    await _firestore.init();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithSigninView();
  }
}
