import 'package:accounting/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';


class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr().toString()),
      ),
      body: Column(
        children: [
          Text(LocaleKeys.hello.tr()),
          Text(LocaleKeys.title.tr()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text("English"),
                onPressed: () async {
                 await context.setLocale(Locale('en', 'GB'));
                }
              ),
              ElevatedButton(
                child: Text("Malay"),
                  onPressed: () async {
                   await context.setLocale(Locale('ms', 'MY'));
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
