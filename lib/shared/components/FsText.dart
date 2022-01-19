import 'dart:io';

import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsFonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum FsTextSize {
  size24,
  size20,
  size18,
  size16,
  size12,
  size10,
}

class FsText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final Color color;
  final FsTextSize size;
  final TextAlign textAlign;

  const FsText(this.text, {
    this.weight = FontWeight.w400,
    this.color = FsColors.black,
    this.size = FsTextSize.size16,
    this.textAlign = TextAlign.left
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontFamily: FsFonts.primary,
            fontWeight: weight,
            fontSize: {
              FsTextSize.size24: 24.0,
              FsTextSize.size20: 20.0,
              FsTextSize.size18: 18.0,
              FsTextSize.size16: 16.0,
              FsTextSize.size12: 12.0,
              FsTextSize.size10: 10.0,
            }[size] as double,
            height: {
              FsTextSize.size24: 28/24,
              FsTextSize.size20: 24/20,
              FsTextSize.size18: 22/18,
              FsTextSize.size16: 20/16,
              FsTextSize.size12: 16/12,
              FsTextSize.size10: 14/10,
            }[size] as double));
  }
}
