import 'package:fast_inspection/ui/shared/authentication_layout/authentication_layout_view.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return AuthenticationLayoutView(
      title: 'Forgot Password?',
      subtitle: 'Recover your password entering your email',
      mainButtonTitle: 'Recover Password',
      signupText: 'Remember your password? Sign in.',
      onSignupTap: viewModel.goToSignin,
      onMainButtonTap: viewModel.sendResetPasswordMail,
      form: const [
        AppTextField(
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email),
        )
      ],
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
