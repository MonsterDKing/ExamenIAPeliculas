import 'package:examenia/Screens/TaPBarView.dart';
import 'package:examenia/services/localstorage.dart';
import 'package:examenia/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:provider/provider.dart';

import 'Screens/LoginView.dart';
import 'provider/index.dart';

void main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'es',
      basePath: 'assets/i18n',
      forcedLocale: const Locale('es'),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp(
    flutterI18nDelegate: flutterI18nDelegate,
  ));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  const MyApp({this.flutterI18nDelegate});

  Widget _getStartupScreen() {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    final String token = localstorage.getUserInfo.accessToken;
    if (token != null) {
      return TapBarView();
    }
    return LoginView();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UsuarioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new TapBarProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Examen IA',
          home: _getStartupScreen()),
    );
  }
}
