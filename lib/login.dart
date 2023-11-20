import 'dart:math';

import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final idInput = TextEditingController();
  final pwInput = TextEditingController();
  final pw2Input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        elevation: 0.0,
        backgroundColor: Color(0xff5865f2),
        centerTitle: true,
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.search), onPressed: () {})
        // ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Center(
            child: Text(
              'Fit\nYour\nDiscord',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Form(
              child: Theme(
            data: ThemeData(
              primaryColor: Colors.grey,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: Container(
                padding: EdgeInsets.all(40.0),
                // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                // SingleChildScrollView으로 감싸 줌
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Id'),
                        keyboardType: TextInputType.text,
                        controller: idInput,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'PW'),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                        controller: pwInput,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: 'PW(If Register)'),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                        controller: pw2Input,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () async {
                              await login(idInput.text, pwInput.text);
                              // String? token = await storage.read(key: 'token');
                              // print(token);
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent),
                          ))
                    ],
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
