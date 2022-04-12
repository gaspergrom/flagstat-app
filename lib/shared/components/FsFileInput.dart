import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsFileInput extends StatelessWidget {
  final Widget? child;

  const FsFileInput({
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
