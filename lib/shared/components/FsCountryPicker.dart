import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsCountryPicker<T> extends ReactiveFormField<T, T> {
  FsCountryPicker(
      {Key? key,
      String? formControlName,
      FormControl<T>? formControl,
      String placeholder = ''})
      : super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<T, T> field) {
            return GestureDetector(
              onTap: () => Get.bottomSheet(const FsCountryPickerModal(),
                  isScrollControlled: true),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 22, top: 17, bottom: 17),
                decoration: BoxDecoration(
                  border: Border.all(color: FsColors.gray, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FsText(placeholder,
                        size: FsTextSize.size16, color: FsColors.grayDark),
                    const Icon(FsIcons.chevron_down, size: 11)
                  ],
                ),
              ),
            );
          },
        );

  @override
  ReactiveFormFieldState<T, T> createState() => ReactiveFormFieldState<T, T>();
}

class FsCountryPickerModal extends StatelessWidget {
  const FsCountryPickerModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Container(
        decoration: const BoxDecoration(
            color: FsColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      ),
    );
  }
}
