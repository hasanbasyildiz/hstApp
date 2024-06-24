import 'package:apphst/pages/home_page.dart';
import 'package:apphst/pages/login_page.dart';
import 'package:apphst/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'api/WeatherProvider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                WeatherProvider(apiKey: '1a44a64d98977ef9ce2dff1aee1350ed', city: 'istanbul')),
        ChangeNotifierProvider(
            create: (_) =>
                WeatherProvider(apiKey: '1a44a64d98977ef9ce2dff1aee1350ed', city: 'ankara')),
        ChangeNotifierProvider(
            create:(_) =>
                WeatherProvider(apiKey: '1a44a64d98977ef9ce2dff1aee1350ed', city: 'izmir')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/loginPage": (context) => LoginPage(),
          "/singUp": (context) => RegisterPage(),
          "/homePage": (context) => homePage(),
        },
        home: LoginPage(),
      ),
    );
  }
}
