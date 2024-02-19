import 'dart:io';

import 'package:e_com/core/utils.dart';
import 'package:e_com/global/app_exception.dart';

abstract class ExceptionHandler {
  ExceptionHandler._();

  void handleException(Object exception, StackTrace stackTrace);
}

class AppExceptionHandler implements ExceptionHandler {
  @override
  void handleException(Object exception, StackTrace stackTrace) {
    if (exception is AppException) {
      showToast(exception.message);
    } else if (exception is SocketException) {
      showToast('No internet connection. Please try again.');
    } else if (exception is FormatException) {
      showToast('Data format error. Please try again.');
    } else {
      showToast('Something went wrong. Please try again.');
    }
  }
}
