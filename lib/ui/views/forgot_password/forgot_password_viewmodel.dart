import 'package:fast_inspection/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();

  Future<void> sendResetPasswordMail() async {}

  void goToSignin() {
    _nav.back();
  }
}
