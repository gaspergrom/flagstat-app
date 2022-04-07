import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/components/shared/FsCheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsCheckbox<bool> extends ReactiveFormField<bool, bool> {
  FsCheckbox({
    Key? key,
    String? formControlName,
    FormControl<bool>? formControl,
    Widget child = const FsText(''),
  }) : super(
    key: key,
    formControl: formControl,
    formControlName: formControlName,
    builder: (ReactiveFormFieldState<bool, bool> field) {
      return GestureDetector(
        onTap: () {
          field.didChange((field.value == false) as bool?);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FsCheck(enabled: field.value == true),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: child,
            )
          ],
        ),
      );
    },
  );

  @override
  ReactiveFormFieldState<bool, bool> createState() => ReactiveFormFieldState<bool, bool>();
}
