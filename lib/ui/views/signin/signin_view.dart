import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_layout_view.dart';
import 'package:fast_inspection/ui/views/signin/signin_view.form.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SigninView extends StackedView<SigninViewModel> with $SigninView {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return AuthenticationLayoutView(
      busy: viewModel.isBusy,
      onMainButtonTap: viewModel.saveData,
      onSignupTap: viewModel.onSignup,
      onForgotPasswordTap: viewModel.onForgotPassword,
      validationMessage: viewModel.validationMessage,
      form: [
        AppTextField(
          hintText: 'Enter your email',
          prefixIcon: const Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock),
          isPassword: true,
          controller: passwordController,
        ),
      ],
    );
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();

  @override
  void onViewModelReady(SigninViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SigninViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
