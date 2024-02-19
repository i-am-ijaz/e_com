import 'dart:developer' as devtools;

import 'package:flutter/material.dart';

extension Log on Object? {
  void log() => devtools.log(toString());

  void logError() => devtools.log('ERROR: ${toString()}');
}

extension Context on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
