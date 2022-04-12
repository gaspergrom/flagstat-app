import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsSearch.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingManagerSuccess extends StatelessWidget {
  const OnboardingManagerSuccess({Key? key}) : super(key: key);

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
                    SvgPicture.asset('assets/images/onboarding/manager-success.svg'),
                    const FsText("Success", size: FsTextSize.size24, weight: FontWeight.bold,),
                    const SizedBox(height: 16,),
                    const FsText("You have successfully added your account and your club! You can start adding players and teams to your club now or do it later.", size: FsTextSize.size16, textAlign: TextAlign.center,),
                  ],
                ),
              ),
              Column(
                children: [
                  FsButton(text: "Add players & teams", handler: () => null),
                  const SizedBox(height: 16,),
                  FsButton(text: "I’ll do it later", type: FsButtonType.secondary, handler: () => null),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
