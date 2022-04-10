import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:async';


class FsSearch extends StatefulWidget {
  final String label;
  final bool lazy;
  final Function(String value) onChange;

  FsSearch({
    this.label = '',
    this.lazy = false,
    this.onChange = _myDefaultFunc,
  });

  static _myDefaultFunc(value){}

  @override
  State<FsSearch> createState() => _FsSearchState();
}

class _FsSearchState extends State<FsSearch> {
  final form = FormGroup({
    'search': FormControl<String>(value: ''),
  });

  String proxyValue = '';

  @override
  void initState() {
    form.control('search').valueChanges.listen((value) {
      setState(() {
        proxyValue = value;
      });
      if(widget.lazy){
        Timer(const Duration(milliseconds: 400), () {
          if(value == proxyValue){
            widget.onChange(value);
          }
        });
      } else {
        widget.onChange(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: ReactiveTextField(
        formControlName: "search",
        autocorrect: false,
        keyboardType: TextInputType.text,
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
          hintText: widget.label,
          prefixIcon: const Icon(FsIcons.search, color: FsColors.grayDark,),
          prefixIconColor: FsColors.grayDark,
          suffixIcon: ReactiveValueListenableBuilder<String>(
            formControlName: 'search',
            builder: (context, control, child) {
              return proxyValue.isNotEmpty
                  ? GestureDetector(
                      onTap: () => form.control('search').value = '',
                      child: const Icon(FsIcons.close_circle, color: FsColors.grayDark,),
                    )
                  : Container(
                      width: 24,
                    );
            },
          ),
          suffixIconColor: FsColors.grayDark,
        ),
        cursorColor: FsColors.primary,
      ),
    );
  }
}
