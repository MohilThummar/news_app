import 'dart:io';

import 'package:flutter/material.dart';

/// NOTE: To Print Long Response Use [log].
/// And to use this import "import 'dart:developer'";

/// <<< Error Massage Red color --------- >>>
void printError(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[91m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Ok Status Massage Green Color --------- >>>
void printOkStatus(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[92m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Warning Massage Yellow Color --------- >>>
void printWarning(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[93m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Action Massage Blue Color --------- >>>
void printAction(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[94m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Cancel Massage Gray Color --------- >>>
void printCancel(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[96m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Error Massage Red color --------- >>>
void printWhite(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[97m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// Color Print code -------------- >>>>
/*
void colorCodeExample() {
  debugPrint("\x1B[1m 1hello \x1B[0m");
  debugPrint("\x1B[3m 3hello \x1B[0m");
  debugPrint("\x1B[4m 4hello \x1B[0m");
  debugPrint("\x1B[7m 7hello \x1B[0m");
  debugPrint("\x1B[9m 9hello \x1B[0m");
  debugPrint("\x1B[21m 21hello \x1B[0m");
  debugPrint("\x1B[30m 30hello \x1B[0m");
  debugPrint("\x1B[31m 31hello \x1B[0m");
  debugPrint("\x1B[32m 32hello \x1B[0m");
  debugPrint("\x1B[33m 33hello \x1B[0m");
  debugPrint("\x1B[34m 34hello \x1B[0m");
  debugPrint("\x1B[35m 35hello \x1B[0m");
  debugPrint("\x1B[36m 36hello \x1B[0m");
  debugPrint("\x1B[37m 37hello \x1B[0m");
  debugPrint("\x1B[40m 40hello \x1B[0m");
  debugPrint("\x1B[41m 41hello \x1B[0m");
  debugPrint("\x1B[42m 42hello \x1B[0m");
  debugPrint("\x1B[43m 43hello \x1B[0m");
  debugPrint("\x1B[44m 44hello \x1B[0m");
  debugPrint("\x1B[45m 45hello \x1B[0m");
  debugPrint("\x1B[46m 46hello \x1B[0m");
  debugPrint("\x1B[47m 47hello \x1B[0m");
  debugPrint("\x1B[51m 51hello \x1B[0m");
  debugPrint("\x1B[52m 52hello \x1B[0m");
  debugPrint("\x1B[90m 90hello \x1B[0m");
  debugPrint("\x1B[91m 91hello \x1B[0m");
  debugPrint("\x1B[92m 92hello \x1B[0m");
  debugPrint("\x1B[93m 93hello \x1B[0m");
  debugPrint("\x1B[94m 94hello \x1B[0m");
  debugPrint("\x1B[95m 95hello \x1B[0m");
  debugPrint("\x1B[96m 96hello \x1B[0m");
  debugPrint("\x1B[97m 97hello \x1B[0m");
  debugPrint("\x1B[100m 100hello \x1B[0m");
  debugPrint("\x1B[101m 101hello \x1B[0m");
  debugPrint("\x1B[102m 102hello \x1B[0m");
  debugPrint("\x1B[103m 103hello \x1B[0m");
  debugPrint("\x1B[104m 104hello \x1B[0m");
  debugPrint("\x1B[105m 105hello \x1B[0m");
  debugPrint("\x1B[106m 106hello \x1B[0m");
  debugPrint("\x1B[107m 107hello \x1B[0m");
  debugPrint("\x1B[108m 108hello \x1B[0m");
}
*/
