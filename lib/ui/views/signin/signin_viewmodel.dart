import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SigninViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();

  Future<void> signin() async {}
  void onForgotPassword() {
    _nav.navigateToForgotPasswordView();
  }

  void onSignup() {
    _nav.navigateToSignupView();
  }
}
