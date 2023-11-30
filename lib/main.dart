import 'package:flutter/material.dart';
import 'login.dart';
// import 'API.dart';

void main() {
  // final initialize = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogIn(),
      theme: ThemeData(),
    );
  }
}
