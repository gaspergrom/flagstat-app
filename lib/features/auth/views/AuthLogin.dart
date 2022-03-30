import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/services/device.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'password':
        FormControl<String>(value: '', validators: [Validators.required]),
  });

  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Log in'),
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          child: ReactiveForm(
            formGroup: this.form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                    SizedBox(
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
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FsText('Don\'t have an account? '),
                        GestureDetector(
                            onTap: () => Get.offNamed(FsRoute.authRegister),
                            child: FsText(
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
    );
  }

  onSubmit() async {
    dynamic value = this.form.value;
    var deviceData = await deviceService.getDeviceInfo();
    authController.login(
      email: value['email'],
      password: value['password'],
      device: deviceData,
    );
  }
}
