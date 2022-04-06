import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/services/email.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRegisterSuccess extends StatefulWidget {
  const AuthRegisterSuccess({Key? key}) : super(key: key);

  @override
  State<AuthRegisterSuccess> createState() => _AuthRegisterSuccessState();
}

class _AuthRegisterSuccessState extends State<AuthRegisterSuccess> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: ''),
      backgroundColor: FsColors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/auth/verify-email.png',
                        width: 154,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const FsText(
                    'Verify your email',
                    size: FsTextSize.size24,
                    textAlign: TextAlign.center,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FsText(
                    'We sent a verification email to ${authController.user.value.email}. Please tap the link inside that email to continue.',
                    size: FsTextSize.size16,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  FsButton(text: 'Check my inbox', handler: () async => emailService.openEmailApp()),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FsText('Didn\'t get the email? '),
                      GestureDetector(
                          onTap: (){
                            // TODO: resend email
                            print('resend');
                          },
                          child: const FsText(
                            'Resend',
                            weight: FontWeight.w500,
                            color: FsColors.primary,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
