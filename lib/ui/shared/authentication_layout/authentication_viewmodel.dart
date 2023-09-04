import 'package:fast_inspection/app/app.locator.dart';
import 'package:fast_inspection/app/app.logger.dart';
import 'package:fast_inspection/exceptions/firestore_api_exception.dart';
import 'package:fast_inspection/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fast_inspection/models/app_models.dart' as model;

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');
  final _nav = locator<NavigationService>();
  final _userService = locator<UserService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  Future saveData() async {
    setValidationMessage(null);
    notifyListeners();
    try {
      final (result, user) = await runBusyFuture(
        runAuthentication(),
        throwException: true,
      );
      handleAuthResponse(result, user);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> handleAuthResponse(
      FirebaseAuthenticationResult result, model.User? user) async {
    if (!result.hasError && result.user != null) {
      if (user != null) {
        await _userService.syncOrCreateUserAccount(user);
      } else {
        await _userService.syncUserAccount();
      }
      await _nav.replaceWith(successRoute);
    } else {
      setValidationMessage(result.errorMessage);
      notifyListeners();
    }
  }

  Future<(FirebaseAuthenticationResult, model.User?)> runAuthentication();
}
