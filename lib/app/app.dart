import 'package:fast_inspection/ui/views/home/home_view.dart';
import 'package:fast_inspection/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
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
    MaterialRoute(page: SigninView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: ForgotPasswordView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    // @stacked-'service'
  ],
  logger: StackedLogger(),
)
class App {}
