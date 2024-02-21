import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LocalizationChecker {
  static void changeLanguage(BuildContext context, VoidCallback rebuild) {
    final currentLocale = EasyLocalization.of(context)?.locale; // Use non-null assertion

    if (currentLocale != null) {
      if (currentLocale == const Locale('en', 'US')) {
        EasyLocalization.of(context)?.setLocale(const Locale('hi', 'IN'));
      } else {
        EasyLocalization.of(context)?.setLocale(const Locale('en', 'US'));
      }
      rebuild();
    }
  }
}