import 'package:fast_inspection/api/firestore_api.dart';
import 'package:fast_inspection/services/user_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firestore = locator<FirestoreApi>();
  final _user = locator<UserService>();

  // Place anything here that needs to happen before we get into the application
  Future<void> runStartupLogic() async {
    FlutterNativeSplash.remove();
    await _firestore.init();
    if (_user.hasUser) {
      await _user.syncUserAccount();
      return _replaceSplash(Routes.homeView);
    }

    return _replaceSplash(Routes.signinView);
  }

  Future<void> _replaceSplash(String routeName) async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.replaceWith(routeName);
  }
}
