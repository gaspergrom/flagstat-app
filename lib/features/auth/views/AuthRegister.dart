import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsCheckbox.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/constants/FsValidators.dart';
import 'package:flagstat_app/shared/services/device.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthRegister extends StatelessWidget {
  AuthRegister({Key? key}) : super(key: key);

  final AuthController authController = Get.find<AuthController>();

  final form = FormGroup({
    'email': FormControl<String>(
        value: '', validators: [Validators.required, Validators.email]),
    'password':
    FormControl<String>(value: '', validators: [Validators.required, Validators.minLength(8), FsValidators.password]),
    'terms': FormControl<bool>(value: false),
    'newsletter': FormControl<bool>(value: false),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FsAppBar(title: 'Create account'),
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
                        helper: 'Minimum 8 characters, 1 uppercase letter & 1 number.',
                        validationMessages: (control) => {
                          ValidationMessage.required: 'Please enter your password',
                          ValidationMessage.minLength: 'Password must be minimum 8 characters long',
                          ValidationMessage.pattern: 'Password must include at least 1 uppercase letter & 1 number',
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
                      FsCheckbox(
                        formControlName: 'newsletter',
                        child: const FsText('I would like to receive news & updates via email', size: FsTextSize.size12,),
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
      form.reset();
      Get.toNamed(FsRoute.authRegisterSuccess);
      return res;
    });
  }
}
