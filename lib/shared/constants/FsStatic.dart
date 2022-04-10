import 'dart:ui';

import 'package:flutter/material.dart';

class FsStatic {
  static List<String> getAlphabet() {
    var aCode = 'A'.codeUnitAt(0);
    var zCode = 'Z'.codeUnitAt(0);
    List<String> alphabets = List<String>.generate(
      zCode - aCode + 1,
          (index) => String.fromCharCode(aCode + index),
    );
    return alphabets;
  }
}