import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/services/email.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthForgotPasswordSuccess extends StatefulWidget {
  const AuthForgotPasswordSuccess({Key? key}) : super(key: key);

  @override
  State<AuthForgotPasswordSuccess> createState() => _AuthForgotPasswordSuccessState();
}

class _AuthForgotPasswordSuccessState extends State<AuthForgotPasswordSuccess> {
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
                        'assets/images/auth/forgot-password.png',
                        width: 154,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const FsText(
                    'Reset link send',
                    size: FsTextSize.size24,
                    textAlign: TextAlign.center,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FsText(
                    'We sent a password reset link. Check your inbox and follow the link to set your new password.',
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
