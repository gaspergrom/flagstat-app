import 'package:flagstat_app/shared/components/FsAppBar.dart';
import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsInput.dart';
import 'package:flagstat_app/shared/components/FsPasswordInput.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppBar(title: 'Create account'),
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
                FsButton(text: 'Create account', handler: () => false)
              ],
            )
          ],
        ),
      ),
    );
  }
}
