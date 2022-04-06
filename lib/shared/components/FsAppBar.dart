import 'dart:io';

import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

FsAppBar({required title, hideBackButton = false}) {
  return AppBar(
    centerTitle: true,
    leading: !hideBackButton ? GestureDetector(
      child: Icon(
        FsIcons.back_arrow,
        color: Colors.black,
        size: 32,
      ),
      onTap: () => Get.back(),
    ) : Container(),
    title: FsText(title,
      weight: FontWeight.w700,),
    backgroundColor: FsColors.white,
    elevation: 0,
  );
}
