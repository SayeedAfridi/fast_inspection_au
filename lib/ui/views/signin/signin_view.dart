import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_layout_view.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'signin_viewmodel.dart';

class SigninView extends StackedView<SigninViewModel> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return AuthenticationLayoutView(
      onMainButtonTap: viewModel.signin,
      onSignupTap: viewModel.onSignup,
      onForgotPasswordTap: viewModel.onForgotPassword,
      form: const [
        AppTextField(
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter your password',
          prefixIcon: Icon(Icons.lock),
          isPassword: true,
        ),
      ],
    );
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();
}
