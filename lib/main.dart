import 'package:flutter/material.dart';
import 'fyd_login.dart';
import 'API.dart';

Future<void> main() async {
  final initialize = WidgetsFlutterBinding.ensureInitialized();
  var response = await login('admin', 'admin');
  if (response == 200) {
    String? refresh = await storage.read(key: 'refresh');
    String? token = await storage.read(key: 'token');
    print(refresh);
    print(token);
    print(await createLike(16));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FYDLogin(),
    );
  }
}
