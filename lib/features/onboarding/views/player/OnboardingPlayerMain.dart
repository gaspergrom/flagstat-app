import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsSearch.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPlayerMain extends StatefulWidget {
  const OnboardingPlayerMain({Key? key}) : super(key: key);

  @override
  State<OnboardingPlayerMain> createState() => _OnboardingPlayerMainState();
}

class _OnboardingPlayerMainState extends State<OnboardingPlayerMain> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Link profile', hideBackButton: true),
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 24, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: FsSearch(
                      label: 'Search for your name',
                      lazy: false,
                      onChange: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  mainDisplay()
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    FsButton(
                        text: "Claim your existing profile", handler: () => null),
                    const SizedBox(
                      height: 16,
                    ),
                    FsButton(
                      text: "Manually create your profile",
                      handler: () => Get.back(),
                      type: FsButtonType.secondary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  mainDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 8,
          ),
          FsText(
            "Your club manager/coach might have already created your player profile.",
            size: FsTextSize.size24,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 16,
          ),
          FsText(
              "Search for your name to link your account to possibly existing player profile. If you can’t find it, continue by manually creating it.")
        ],
      ),
    );
  }

  searchResults() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 40, right: 40),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: FsColors.gray, width: 1))),
      child: Column(
        children: [
          player(),
          player(),
          player(),
        ],
      ),
    );
  }

  player() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/images/global/no_avatar.png',
                    height: 32,
                    width: 32,
                  )),
              const SizedBox(
                width: 8,
              ),
              const FsText(
                'Aljoša Kous',
                size: FsTextSize.size16,
              ),
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/global/no_avatar.png',
                height: 24,
                width: 24,
              )),
        ],
      ),
    );
  }

  noSearchResults() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: FsColors.gray, width: 1))),
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/global/no_results.svg',
            width: 120,
            height: 120,
          ),
          const SizedBox(
            height: 16,
          ),
          const FsText(
            "No results for",
            size: FsTextSize.size18,
            textAlign: TextAlign.center,
          ),
          FsText(
            "“$searchQuery”",
            size: FsTextSize.size18,
            textAlign: TextAlign.center,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
