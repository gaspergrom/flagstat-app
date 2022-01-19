import 'dart:io';

import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsFonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum FsButtonType {
  primary,
  secondary,
  tertiary
}

class FsButton extends StatelessWidget {
  final String text;
  final Function handler;
  final bool disabled;
  final bool isLoading;
  final FsButtonType type;

  const FsButton({
    required this.text,
    required this.handler,
    this.isLoading = false,
    this.disabled = false,
    this.type = FsButtonType.primary,
  });


  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: disabled ? {
                  FsButtonType.primary: FsColors.gray,
                  FsButtonType.secondary: FsColors.gray,
                  FsButtonType.tertiary: FsColors.white,
                }[type] as Color : {
                  FsButtonType.primary: FsColors.primary,
                  FsButtonType.secondary: FsColors.gray,
                  FsButtonType.tertiary: FsColors.transparent,
                }[type] as Color,
                width: 2
            ),
            borderRadius: BorderRadius.circular(6)
        ),
        child: CupertinoButton(
            pressedOpacity: 1,
            borderRadius: BorderRadius.circular(4),
            minSize: type == FsButtonType.tertiary ? 20 : 56,
            padding: type == FsButtonType.tertiary ? EdgeInsets.all(0) : EdgeInsets.all(18),
            color: {
              FsButtonType.primary: FsColors.primary,
              FsButtonType.secondary: FsColors.white,
              FsButtonType.tertiary: FsColors.transparent,
            }[type] as Color,
            disabledColor: {
              FsButtonType.primary: FsColors.gray,
              FsButtonType.secondary: FsColors.gray,
              FsButtonType.tertiary: FsColors.white,
            }[type] as Color,
            child: Container(
              width: double.infinity,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: FsFonts.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: disabled
                          ? FsColors.grayDark
                          : {
                        FsButtonType.primary: FsColors.white,
                        FsButtonType.secondary: FsColors.primary,
                        FsButtonType.tertiary: FsColors.primary,
                      }[type] as Color)),
            ),
            onPressed: disabled ? null : () => handler()),
      );
    }
    else {
      return ElevatedButton(child: Text(text), onPressed: () => handler());
    }
  }
}
