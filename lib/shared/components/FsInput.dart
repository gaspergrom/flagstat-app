import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsInput extends StatelessWidget {
  final String label;
  final TextInputType type;
  final String formControlName;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final Function()? onSubmitted;

  const FsInput({
    required this.formControlName,
    this.label = '',
    this.validationMessages,
    this.onSubmitted,
    this.type = TextInputType.none,
  });

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    return ReactiveTextField(
        onSubmitted: onSubmitted,
        autocorrect: false,
        formControlName: formControlName,
        validationMessages: validationMessages,
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
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.error, width: 2.0)),
          labelText: label,
        ),
        cursorColor: FsColors.primary,
        showErrors: (control) => control.invalid && control.touched);
  }
}
