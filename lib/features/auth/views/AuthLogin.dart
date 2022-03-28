import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Log in'),
      backgroundColor: FsColors.white,
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                FsInput(label: 'Email', type: TextInputType.emailAddress),
                SizedBox(
                  height: 16,
                ),
                FsPasswordInput(label: 'Password')
              ],
            ),
            Column(
              children: [
                FsButton(text: 'Log in', handler: () => false),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FsText('Don\'t have an account? '),
                    GestureDetector(
                        onTap: () => Get.offNamed(FsRoute.authRegister),
                        child: FsText(
                          'Create one',
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
    );
  }
}
