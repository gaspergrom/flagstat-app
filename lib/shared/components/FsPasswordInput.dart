import 'dart:io';

import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsPasswordInput extends StatefulWidget {
  final String label;
  final String formControlName;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final Function()? onSubmitted;

  const FsPasswordInput({
    required this.formControlName,
    this.validationMessages,
    this.onSubmitted,
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
    final form = ReactiveForm.of(context);
    return ReactiveTextField(
      onSubmitted: widget.onSubmitted,
        formControlName: widget.formControlName,
        validationMessages: widget.validationMessages,
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
              ),
            ),
            floatingLabelStyle: TextStyle(
                color: form?.findControl(widget.formControlName)?.invalid ==
                            true &&
                        form?.findControl(widget.formControlName)?.touched ==
                            true
                    ? FsColors.error
                    : FsColors.primary)),
        cursorColor: FsColors.primary,
        showErrors: (control) =>
            control.invalid && control.touched && control.dirty);
  }
}
