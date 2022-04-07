import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsCountryPicker.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsRadioBox.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OnboardingVisitorMain extends StatelessWidget {
  OnboardingVisitorMain({Key? key}) : super(key: key);

  final form = FormGroup({
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'country': FormControl<String>(value: '', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FsAppBar(title: 'Fill in your details', hideBackButton: true),
        backgroundColor: FsColors.white,
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Column(
                      children: [
                        FsInput(
                          label: 'First & Last name',
                          formControlName: 'name',
                          validationMessages: (control) => {
                            ValidationMessage.required: 'Please enter your name',
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FsCountryPicker(
                          formControlName: 'country',
                          placeholder: 'Your country',
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      FsButton(text: "Finish", handler: () => null),
                      const SizedBox(
                        height: 24,
                      ),
                      FsButton(
                        text: "Change my role",
                        handler: () => Get.back(),
                        type: FsButtonType.tertiary,
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
}
