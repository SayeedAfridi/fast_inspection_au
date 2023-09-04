import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.logger.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fast_inspection/models/app_models.dart' as model;

import 'signin_view.form.dart';

class SigninViewModel extends AuthenticationViewModel {
  final log = getLogger('SigninViewmodel');
  final NavigationService _nav = locator<NavigationService>();
  final _auth = locator<FirebaseAuthenticationService>();
  SigninViewModel() : super(successRoute: Routes.homeView);

  void onForgotPassword() {
    _nav.navigateToForgotPasswordView();
  }

  void onSignup() {
    _nav.navigateToSignupView();
  }

  @override
  Future<(FirebaseAuthenticationResult, model.User?)>
      runAuthentication() async {
    final result = await _auth.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
    return (result, null);
  }
}
