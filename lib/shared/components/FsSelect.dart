import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsSelect extends StatelessWidget {
  final String label;
  final String formControlName;
  final List<DropdownMenuItem> items;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;

  const FsSelect({
    required this.formControlName,
    this.label = '',
    this.validationMessages,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField(
        formControlName: formControlName,
        validationMessages: validationMessages,
        items: items,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16, 17, 16, 17),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: FsColors.gray, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.primary, width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.gray, width: 2.0)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.error, width: 2.0)),
          labelText: label,
        ),
        icon: Container(
            padding: const EdgeInsets.only(right: 8),
            child: const Icon(FsIcons.chevron_down, size: 11)),
        iconEnabledColor: FsColors.black,
        showErrors: (control) => control.invalid && control.touched);
  }
}
