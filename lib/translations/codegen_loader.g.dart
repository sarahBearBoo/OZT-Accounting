// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_GB = {
  "hello": "Hello",
  "title": "English Language"
};
static const Map<String,dynamic> ms_MY = {
  "hello": "Helo",
  "title": "Bahasa Malaysia"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_GB": en_GB, "ms_MY": ms_MY};
}
