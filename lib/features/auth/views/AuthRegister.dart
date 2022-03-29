import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/cupertino.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Create account'),
      backgroundColor: FsColors.white,
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
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
                      if(form.valid){
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
                          text: 'Create account',
                          disabled: form.invalid,
                          handler: () => print(form.value),
                      );
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FsText('Already have an account? '),
                      GestureDetector(
                          onTap: () => Get.offNamed(FsRoute.authLogin),
                          child: FsText(
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
    );
  }

  onSubmit(){
    var value = this.form.value;
    print(value);
  }
}