import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthFogotPassword extends StatefulWidget {
  const AuthFogotPassword({Key? key}) : super(key: key);

  @override
  State<AuthFogotPassword> createState() => _AuthForgotPasswordState();
}

class _AuthForgotPasswordState extends State<AuthFogotPassword> {
  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
  });

  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FsAppBar(title: 'Update password'),
        backgroundColor: FsColors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FsText('Forgot password?', size: FsTextSize.size24, weight: FontWeight.bold,),
                      const SizedBox(height: 16,),
                      const FsText('Enter the email address you signed up with to receive a link to reset your password.', size: FsTextSize.size16),
                      const SizedBox(height: 40,),
                      FsInput(
                        label: 'Email',
                        type: TextInputType.emailAddress,
                        formControlName: 'email',
                        validationMessages: (control) => {
                          ValidationMessage.required: 'Please enter your email',
                          ValidationMessage.email: 'Please enter valid email',
                        },
                        onSubmitted: () {
                          form.control('password').focus();
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ReactiveFormConsumer(
                        builder: (context, form, child) {
                          return FsButton(
                              text: 'Send email',
                              disabled: form.invalid,
                              handler: () => form.valid ? onSubmit() : null);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FsText('Did you remember your password? '),
                          GestureDetector(
                              onTap: () => Get.offNamed(FsRoute.authLogin),
                              child: const FsText(
                                'Log in',
                                weight: FontWeight.w500,
                                color: FsColors.primary,
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    dynamic value = form.value;
    authController.passwordReset(
      email: value['email'],
    ).then(() {
      Get.toNamed(FsRoute.authForgotPasswordSuccess);
    });
  }
}
