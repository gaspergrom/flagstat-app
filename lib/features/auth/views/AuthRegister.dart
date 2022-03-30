import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsCheckbox.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/services/device.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({Key? key}) : super(key: key);

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'password':
        FormControl<String>(value: '', validators: [Validators.required]),
    'terms': FormControl<bool>(value: false),
    'newsletter': FormControl<bool>(value: false),
  });

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Create account'),
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          child: ReactiveForm(
            formGroup: form,
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
                    const SizedBox(
                      height: 36,
                    ),
                    const FsCheckbox(
                      formControlName: 'newsletter',
                      child: FsText('I would like to receive news & updates via email', size: FsTextSize.size12,),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FsCheckbox(
                      formControlName: 'terms',
                      child: Row(
                        children: const [
                          FsText('I agree to ', size: FsTextSize.size12,),
                          FsText('Terms', size: FsTextSize.size12, weight: FontWeight.w500, color: FsColors.primary,),
                          FsText(' & ', size: FsTextSize.size12,),
                          FsText('Privacy Policy', size: FsTextSize.size12, weight: FontWeight.w500, color: FsColors.primary,),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return FsButton(
                          text: 'Create account',
                          disabled: form.invalid || !(form.value['terms'] as bool),
                          handler: () => form.valid && form.control('terms').value ? onSubmit() : null,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FsText('Already have an account? '),
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
    );
  }

  onSubmit() async {
    dynamic value = form.value;
    var deviceData = await deviceService.getDeviceInfo();
    authController
        .register(
      email: value['email'],
      password: value['password'],
      device: deviceData,
      terms: value['terms'],
      newsletter: value['newsletter'],
    )
    .then((res) {
      print('registered');
      return res;
    });
  }
}
