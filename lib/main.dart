import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gastosappg8/pages/home_page.dart';

// im;
void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // GlobalMaterialLocalizations.
      ],
      supportedLocales: [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
    ),
  );
}
