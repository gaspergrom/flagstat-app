import 'dart:io';

import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FsInput extends StatelessWidget {
  final String label;
  final TextInputType type;

  const FsInput({
    this.label = '',
    this.type = TextInputType.none
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 20),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: FsColors.gray, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.primary, width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.gray, width: 2.0)),
          labelText: this.label,
          labelStyle: TextStyle(color: FsColors.grayDark),
          floatingLabelStyle: TextStyle(color: FsColors.primary)),
      cursorColor: FsColors.primary,
    );
  }
}
