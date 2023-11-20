import 'dart:math';

import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:discord_flutter/fyd_main.dart';

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
                            const InputDecoration(labelText: 'PW(If Register)'),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                        controller: pw2Input,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (formValidation()) {
                                  int? result = await register(idInput.text,
                                      pwInput.text, pw2Input.text);
                                  print(result);
                                  if (result == 201) {
                                    //TODO: pop-up Alert
                                    print('Register Success.');
                                  } else {
                                    // TODO: Pop-up Alert로 교체
                                    print('Register Failed.');
                                  }
                                } else {
                                  //TODO: pop-up Alert
                                  print('Form Validation Failed.');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(120, 50),
                              ),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5865f2),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                String? token =
                                    await storage.read(key: 'token');
                                print("before: $token");
                                int? result =
                                    await login(idInput.text, pwInput.text);
                                if (result == 200) {
                                  token = await storage.read(key: 'token');
                                  print('after: $token');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FYDMain(),
                                    ),
                                  );
                                } else {
                                  // TODO: Pop-up Alert로 교체
                                  print('Login Failed.');
                                }
                                // String? token = await storage.read(key: 'token');
                                // print(token);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(120, 50),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5865f2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool formValidation() {
    bool validation = true;

    if (pwInput.text != pw2Input.text) {
      //TODO: pop-up
      print('password inputs are not same.');
      validation = false;
    }
    if (pwInput.text.length < 8) {
      //TODO: pop-up
      print('pwInput length is less than 8.');
      validation = false;
    }
    if (pw2Input.text.length < 8) {
      //TODO: pop-up
      print('pw2Input length is less than 8.');
      validation = false;
    }
    return validation;
  }
}
