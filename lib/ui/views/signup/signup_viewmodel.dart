import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.router.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fast_inspection/models/app_models.dart' as model;

import 'signup_view.form.dart';

class SignupViewModel extends AuthenticationViewModel {
  final NavigationService _nav = locator<NavigationService>();
  final _auth = locator<FirebaseAuthenticationService>();

  SignupViewModel() : super(successRoute: Routes.homeView);

  void goToSignin() {
    _nav.back();
  }

  @override
  Future<(FirebaseAuthenticationResult, model.User?)>
      runAuthentication() async {
    final result = await _auth.createAccountWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );

    final user = model.User(
      id: result.user!.uid,
      fullname: fullNameValue!,
      email: emailValue!,
      phone: 'xxx',
    );

    return (result, user);
  }
}
