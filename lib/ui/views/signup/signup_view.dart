import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:fast_inspection/ui/shared/authentication_layout/authentication_layout_view.dart';
import 'package:fast_inspection/ui/views/signup/signup_view.form.dart';
import 'package:fast_inspection/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignupView extends StackedView<SignupViewModel> with $SignupView {
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
      onMainButtonTap: viewModel.saveData,
      busy: viewModel.isBusy,
      validationMessage: viewModel.validationMessage,
      form: [
        AppTextField(
          hintText: 'Enter full name',
          prefixIcon: const Icon(Icons.person),
          controller: fullNameController,
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter email',
          prefixIcon: const Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        verticalSpaceMedium,
        AppTextField(
          hintText: 'Enter password',
          prefixIcon: const Icon(Icons.lock),
          isPassword: true,
          controller: passwordController,
        ),
      ],
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SignupViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
