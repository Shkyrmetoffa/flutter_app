import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/http_service.dart';
import 'package:flutter_app/router.dart' as Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  LocalizedData localizedData = LocalizedData();

  await Firebase.initializeApp();
  await appLanguage.fetchLocale();
  await localizedData.getDataFromInitRequest();

  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => appLanguage),
          ChangeNotifierProvider(create: (_) => localizedData),
        ],
          child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage? appLanguage;
  final LocalizedData? localizedData;

  MyApp({this.appLanguage, this.localizedData});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: Router.Router.generateRoute,
        locale: context.watch<AppLanguage>().appLocal,
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ru', ''),
          const Locale('et', ''),
          const Locale('lt', ''),
          const Locale('uz', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
  }
}
