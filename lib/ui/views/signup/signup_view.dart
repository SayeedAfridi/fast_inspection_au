import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_layout_view.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return AuthenticationLayoutView(
      title: 'Sign up',
      subtitle: 'Welcome! Create a new account.',
      mainButtonTitle: 'Sign up',
      signupText: 'Already have an account? Sign in.',
      onSignupTap: viewModel.goToSignin,
      onMainButtonTap: viewModel.signup,
      form: const [
        AppTextField(
          hintText: 'Enter full name',
          prefixIcon: Icon(Icons.person),
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter email',
          prefixIcon: Icon(Icons.email),
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter password',
          prefixIcon: Icon(Icons.lock),
          isPassword: true,
        ),
      ],
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
