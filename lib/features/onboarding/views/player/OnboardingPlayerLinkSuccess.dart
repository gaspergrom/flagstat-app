import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsSearch.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPlayerLinkSuccess extends StatelessWidget {
  const OnboardingPlayerLinkSuccess({Key? key}) : super(key: key);

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
                    SvgPicture.asset('assets/images/onboarding/profile-connect.svg'),
                    const FsText("Success", size: FsTextSize.size24, weight: FontWeight.bold,),
                    const SizedBox(height: 16,),
                    const FsText("You have successfully claimed your profile.", size: FsTextSize.size16, textAlign: TextAlign.center,),
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
