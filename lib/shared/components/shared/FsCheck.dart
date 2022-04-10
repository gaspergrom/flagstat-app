import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flutter/material.dart';

class FsCheck extends StatelessWidget {
  final bool enabled;
  final bool circular;

  FsCheck({
    required this.enabled,
    this.circular = false
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 21,
      height: 21,
      decoration: BoxDecoration(
          border: Border.all(color: enabled ? FsColors.primary : FsColors.gray, width: 2),
          borderRadius: BorderRadius.circular(circular ? 32 : 1),
          color: enabled ? FsColors.primary : FsColors.white
      ),
      child: const Icon(
        FsIcons.checked,
        color: Colors.white,
        size: 10,
      ),
    );
  }
}
