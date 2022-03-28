import 'dart:io';

import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FsPasswordInput extends StatefulWidget {
  final String label;

  const FsPasswordInput({
    this.label = '',
  });

  @override
  State<FsPasswordInput> createState() => _FsPasswordInputState();
}

class _FsPasswordInputState extends State<FsPasswordInput> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.gray, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: FsColors.primary, width: 2.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: FsColors.gray, width: 2.0)),
            labelText: this.widget.label,
            labelStyle: TextStyle(color: FsColors.grayDark),
            floatingLabelStyle: TextStyle(color: FsColors.primary),
            hintStyle: TextStyle(color: Colors.red),
            suffixIcon: GestureDetector(
                onTap: () => {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      })
                    },
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 14, 16, 16),
                  child: FsText(
                    _passwordVisible ? 'Hide' : 'Show',
                    weight: FontWeight.w500,
                    size: FsTextSize.size16,
                    textAlign: TextAlign.right,
                    color: FsColors.primary,
                  ),
                )),
          ),
          cursorColor: FsColors.primary,
        ),
      ],
    );
  }
}
