import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsPasswordInput extends StatefulWidget {
  final String label;
  final String? helper;
  final String formControlName;
  final Map<String, String> Function(FormControl<dynamic>)? validationMessages;
  final Function()? onSubmitted;

  const FsPasswordInput({
    required this.formControlName,
    this.validationMessages,
    this.onSubmitted,
    this.label = '',
    this.helper,
  });

  @override
  State<FsPasswordInput> createState() => _FsPasswordInputState();
}

class _FsPasswordInputState extends State<FsPasswordInput> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
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
          contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: FsColors.gray, width: 2.0),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.primary, width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.gray, width: 2.0)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: FsColors.error, width: 2.0)),
          labelText: widget.label,
          helperText: widget.helper,
          helperStyle: const TextStyle(
            color: FsColors.black,
          ),
          suffixIcon: GestureDetector(
            onTap: () => {
              setState(() {
                _passwordVisible = !_passwordVisible;
              })
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 14, 16, 16),
              child: FsText(
                _passwordVisible ? 'Hide' : 'Show',
                weight: FontWeight.w500,
                size: FsTextSize.size16,
                textAlign: TextAlign.right,
                color: FsColors.primary,
              ),
            ),
          ),
        ),
        cursorColor: FsColors.primary,
        showErrors: (control) => control.invalid && control.touched);
  }
}
