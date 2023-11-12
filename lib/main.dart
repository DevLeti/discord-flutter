import 'package:flutter/material.dart';
import 'fyd_login.dart';
import 'API.dart';

Future<void> main() async {
  final initialize = WidgetsFlutterBinding.ensureInitialized();
  var response = await login('admin', 'admin');
  if (response == 200) {
    print(await deleteServer(26));
  }
  runApp(const MyApp());
}

// String? refresh = await storage.read(key: 'refresh');
// String? token = await storage.read(key: 'token');
// print(refresh);
// print(token);
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
