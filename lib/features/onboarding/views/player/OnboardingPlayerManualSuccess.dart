import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsSearch.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPlayerManualSuccess extends StatelessWidget {
  const OnboardingPlayerManualSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding:
          const EdgeInsets.only(bottom: 24, top: 51, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/onboarding/profile-create.svg'),
                    const FsText("Please note", size: FsTextSize.size24, weight: FontWeight.bold,),
                    const SizedBox(height: 16,),
                    const FsText("Your club manager or coach must verify your account in order for it to be linked to your official player profile.", size: FsTextSize.size16, textAlign: TextAlign.center,),
                  ],
                ),
              ),
              FsButton(text: "Finish", handler: () => null)
            ],
          ),
        ),
      ),
    );
  }
}
