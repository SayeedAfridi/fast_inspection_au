import 'package:fast_inspection/api/firestore_api.dart';
import 'package:fast_inspection/services/user_service.dart';
import 'package:fast_inspection/ui/views/home/home_view.dart';
import 'package:fast_inspection/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fast_inspection/ui/views/signin/signin_view.dart';
import 'package:fast_inspection/ui/views/signup/signup_view.dart';
import 'package:fast_inspection/ui/views/forgot_password/forgot_password_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView),
    CustomRoute(
      page: StartupView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(page: SigninView),
    CupertinoRoute(page: SignupView),
    CupertinoRoute(page: ForgotPasswordView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    Singleton(classType: FirebaseAuthenticationService),
    // @stacked-'service'
  ],
  logger: StackedLogger(),
)
class App {}
