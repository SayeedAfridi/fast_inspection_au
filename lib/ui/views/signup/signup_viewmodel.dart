import 'package:fast_inspection/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();

  Future<void> signup() async {}

  void goToSignin() {
    _nav.back();
  }
}
