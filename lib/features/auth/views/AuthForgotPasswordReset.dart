import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/constants/FsValidators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthFogotPasswordReset extends StatelessWidget {
  AuthFogotPasswordReset({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  final form = FormGroup({
    'password': FormControl<String>(
        value: '', validators: [Validators.required, Validators.minLength(8), FsValidators.password]),
  });

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
                      const FsText('Reset your password', size: FsTextSize.size24, weight: FontWeight.bold,),
                      const SizedBox(height: 8,),
                      const FsText('(gasper.grom@gmail.com)', size: FsTextSize.size16),
                      const SizedBox(height: 40,),
                      FsPasswordInput(
                        label: 'New password',
                        formControlName: 'password',
                        helper: 'Minimum 8 characters, 1 uppercase letter & 1 number.',
                        validationMessages: (control) => {
                          ValidationMessage.required: 'Please enter your password',
                          ValidationMessage.minLength: 'Password must be minimum 8 characters long',
                          ValidationMessage.pattern: 'Password must include at least 1 uppercase letter & 1 number',
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
                              text: 'Confirm new password',
                              disabled: form.invalid,
                              handler: () => form.valid ? onSubmit() : null);
                        },
                      ),
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
