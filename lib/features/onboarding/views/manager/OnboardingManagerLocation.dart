import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsCountryPicker.dart';
import 'package:flagstat_app/shared/components/FsFileInput.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsSelect.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OnboardingManagerLocation extends StatelessWidget {
  OnboardingManagerLocation({Key? key}) : super(key: key);

  final form = FormGroup({
    'country': FormControl<String>(value: '', validators: [Validators.required]),
    'league': FormControl<String>(value: '',),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: FsAppBar(title: 'Fill in your details'),
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
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FsText(
                          'Select clubs country & league',
                          size: FsTextSize.size24,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(height: 40,),
                        FsCountryPicker(
                          formControlName: 'country',
                          placeholder: 'Country',
                        ),
                        const SizedBox(height: 16,),
                        const FsSelect(formControlName: 'league', label: 'League', items: [
                          DropdownMenuItem(value: 'test1', child: FsText('test')),
                          DropdownMenuItem(value: 'test2', child: FsText('test2')),
                        ],)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      FsButton(text: "Continue", handler: () => Get.toNamed(FsRoute.onboardingManagerSuccess)),
                      const SizedBox(
                        height: 24,
                      ),
                      FsButton(
                        text: "I'll do this later",
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
