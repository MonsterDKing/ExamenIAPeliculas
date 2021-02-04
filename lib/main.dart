import 'package:examenia/Screens/TaPBarView.dart';
import 'package:examenia/provider/LoginProvider.dart';
import 'package:examenia/provider/TapBarProvider.dart';
import 'package:examenia/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Screens/LoginView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new TapBarProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Examen IA',
          home: LoginView()),
    );
  }
}
