import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsRadioBox.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OnboardingPlayerMain extends StatelessWidget {
  const OnboardingPlayerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Player'),
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          padding:
          const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(

              ),
              Column(
                children: [
                  FsButton(text: "Finish", handler: () => null),
                  const SizedBox(height: 24,),
                  FsButton(text: "Change my role", handler: () => Get.back(), type: FsButtonType.tertiary,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
