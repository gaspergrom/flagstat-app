import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsRadioBox.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OnboardingMain extends StatelessWidget {
  OnboardingMain({Key? key}) : super(key: key);

  final form = FormGroup({
    'accountType':
        FormControl<String>(value: '', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Account type', hideBackButton: true),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FsText(
                      "Complete registration",
                      size: FsTextSize.size24,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FsText(
                      "Before you start, tell us how do you intend to use this app?",
                      size: FsTextSize.size16,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FsRadioBox(
                      key: const Key('visitor'),
                      value: "visitor",
                      title: "Visitor 👀",
                      formControlName: 'accountType',
                      description:
                          "Choose this if you are currently not an active official player or manager & just want to browse stats.",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FsRadioBox(
                      key: const Key('player'),
                      value: "player",
                      title: "Active official club player 👟",
                      formControlName: 'accountType',
                      description:
                          "Choose this if you are currently playing in a official club.",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FsRadioBox(
                      key: const Key('manager'),
                      value: "manager",
                      title: "Active club manager/coach 🏈",
                      formControlName: 'accountType',
                      description:
                          "Only choose this if you are an active club manager/coach and intend to add clubs/games to the app.",
                    )
                  ],
                ),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return FsButton(
                        text: 'Continue',
                        // disabled: form.invalid,
                        handler: () => nextStep());
                  },
                ),
              ],
            )),
      )),
    );
  }

  nextStep() async {
    dynamic value = form.value;
    switch(value['accountType']){
      case 'visitor':
        Get.toNamed(FsRoute.onboardingVisitorHome);
        break;
      case 'player':
        Get.toNamed(FsRoute.onboardingPlayerHome);
        break;
      case 'manager':
        Get.toNamed(FsRoute.onboardingManagerHome);
        break;
      default:
        Get.toNamed(FsRoute.onboardingManagerHome);
        break;
    }
  }
}
