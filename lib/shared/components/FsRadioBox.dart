import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/components/shared/FsCheck.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsRadioBox<T> extends ReactiveFormField<T, T> {

  FsRadioBox({
    Key? key,
    String? formControlName,
    FormControl<T>? formControl,
    required T value,
    required String title,
    required String description,
  }) : super(
    key: key,
    formControl: formControl,
    formControlName: formControlName,
    builder: (ReactiveFormFieldState<T, T> field) {
      return GestureDetector(
        onTap: () {
          field.control.enabled ? field.didChange(value) : null;
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: field.value == value ? FsColors.primary : FsColors.gray,
                width: 2),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              FsCheck(enabled: field.value == value, circular: true,),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FsText(
                        title,
                        size: FsTextSize.size18,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FsText(description,
                          size: FsTextSize.size12, color: FsColors.grayDark),
                    ],
                  ))
            ],
          ),
        ),
      );
    },
  );

  @override
  ReactiveFormFieldState<T, T> createState() => ReactiveFormFieldState<T, T>();
}
