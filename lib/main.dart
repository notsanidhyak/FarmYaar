import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/auth_provider.dart';
import 'package:reckon_farmyaar/provider/data.dart';
import 'package:reckon_farmyaar/screens/UserInfoScreen.dart';
import 'package:reckon_farmyaar/screens/firstscreen.dart';
import 'package:reckon_farmyaar/screens/homescreen/dash_home.dart';
import 'package:reckon_farmyaar/screens/homescreen/homescreen.dart';
import 'package:reckon_farmyaar/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            // scaffoldBackgroundColor: const Color(0xff151413),
            ),
        debugShowCheckedModeBanner: false,
        home: const Dashboard(),
      ),
    );
  }
}
