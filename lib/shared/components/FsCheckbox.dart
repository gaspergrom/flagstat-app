import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsCheckbox extends StatelessWidget {
  final Widget child;
  final String formControlName;

  const FsCheckbox({
    required this.formControlName,
    this.child = const FsText(''),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Transform.scale(
            child: ReactiveCheckbox(formControlName: formControlName,),
            scale: 1.33,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: child,
        )
      ],
    );
  }
}
