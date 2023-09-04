import 'package:fast_inspection/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class AuthenticationLayoutView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final String? validationMessage;
  final String signupText;
  final List<Widget> form;
  final void Function()? onMainButtonTap;
  final void Function()? onSignupTap;
  final void Function()? onForgotPasswordTap;
  final bool busy;

  const AuthenticationLayoutView({
    Key? key,
    this.title = 'Sign in',
    this.subtitle = 'Sign in with your email and password',
    this.mainButtonTitle = 'Sign in',
    this.validationMessage,
    this.signupText = "Don't have an account ? Sign up.",
    this.onMainButtonTap,
    this.onSignupTap,
    this.onForgotPasswordTap,
    this.busy = false,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icons/logo_512.png',
                height: 48,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fast Inspection',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Inspection made easy',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpaceMedium,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceTiny,
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              verticalSpaceMedium,
              if (validationMessage != null)
                Text(
                  validationMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              if (validationMessage != null) verticalSpaceSmall,
              ...form,
              if (onForgotPasswordTap != null)
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: onForgotPasswordTap,
                    child: const Text('Forgot Password?'),
                  ),
                ),
              verticalSpaceMedium,
              FilledButton(
                onPressed: onMainButtonTap,
                child: busy
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                            color: Colors.purple.shade400),
                      )
                    : Text(mainButtonTitle),
              ),
              verticalSpaceSmall,
              TextButton(onPressed: onSignupTap, child: Text(signupText))
            ],
          ),
        ),
      ),
    );
  }
}
