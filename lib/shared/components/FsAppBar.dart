import 'dart:io';

import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsFonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

FsAppBar({required title}) {
  return AppBar(
    title: FsText(title,
      weight: FontWeight.w700,),
    backgroundColor: FsColors.white,
    elevation: 0,
  );
}
