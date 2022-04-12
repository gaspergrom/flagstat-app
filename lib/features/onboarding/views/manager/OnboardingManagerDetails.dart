import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsCountryPicker.dart';
import 'package:flagstat_app/shared/components/FsFileInput.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OnboardingManagerDetails extends StatelessWidget {
  OnboardingManagerDetails({Key? key}) : super(key: key);

  final form = FormGroup({
    'logo': FormControl<String>(value: ''),
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'abbrevition':
        FormControl<String>(value: '', validators: [Validators.required]),
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
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FsText(
                          'Add your club',
                          size: FsTextSize.size24,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(height: 16),
                        const FsText(
                            'Keep in mind we’ll verify information you enter, so please make sure it’s real.',
                            size: FsTextSize.size16),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FsFileInput(
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(120),
                                        color: FsColors.gray),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [SvgPicture.asset(
                                        'assets/icons/camera.svg',
                                        height: 22,
                                        width: 28,
                                      )],
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  const FsText('Upload your club logo')
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                        FsInput(
                          label: 'Club name',
                          formControlName: 'name',
                          validationMessages: (control) => {
                            ValidationMessage.required: 'Please enter your club name',
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FsInput(
                          label: 'Club Abbrevition (max 3 characters)',
                          formControlName: 'abbrevition',
                          validationMessages: (control) => {
                            ValidationMessage.required: 'Please enter your club name',
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      FsButton(text: "Continue", handler: () => Get.toNamed(FsRoute.onboardingManagerLocation)),
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
