import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/services/device.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthLogin extends StatelessWidget {
  AuthLogin({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'password':
    FormControl<String>(value: '', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FsAppBar(title: 'Log in'),
        backgroundColor: FsColors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                      const SizedBox(
                        height: 16,
                      ),
                      FsPasswordInput(
                        label: 'Password',
                        formControlName: 'password',
                        validationMessages: (control) => {
                          ValidationMessage.required: 'Please enter your password',
                        },
                        onSubmitted: () {
                          if (form.valid) {
                            onSubmit();
                          }
                        },
                      ),
                      const SizedBox(height: 24,),
                      GestureDetector(
                        onTap: () => Get.toNamed(FsRoute.authForgotPassword),
                        child: const FsText('Forgot password?', size: FsTextSize.size12, weight: FontWeight.w500, textAlign: TextAlign.right, color: FsColors.primary,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ReactiveFormConsumer(
                        builder: (context, form, child) {
                          return FsButton(
                              text: 'Log in',
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
                          const FsText('Don\'t have an account? '),
                          GestureDetector(
                              onTap: () => Get.offNamed(FsRoute.authRegister),
                              child: const FsText(
                                'Create one',
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
    var deviceData = await deviceService.getDeviceInfo();
    authController.login(
      email: value['email'],
      password: value['password'],
      device: deviceData,
    ).then(() {
      //TODO: redirect
      print('loggedin');
    });
  }
}
