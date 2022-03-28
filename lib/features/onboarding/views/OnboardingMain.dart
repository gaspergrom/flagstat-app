import 'package:flagstat_app/features/onboarding/views/OnboardingLogin.dart';
import 'package:flagstat_app/features/onboarding/views/OnboardingRegister.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FsColors.white,
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flagstat_logo.png',
                        width: 204,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 295,
                    child: FsText('Tracking statistics of players and different teams in flag football',
                      textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
            Column(
              children: [
                FsButton(
                    text: 'Get started',
                    handler: () => Get.to(OnboardingRegister())
                ),
                SizedBox(
                  height: 16,
                ),
                FsButton(
                    text: 'I already have an account',
                    type: FsButtonType.secondary,
                  handler: () => Get.to(OnboardingLogin())
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
