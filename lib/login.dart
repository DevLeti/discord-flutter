import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:discord_flutter/serverList.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final idInput = TextEditingController();
  final pwInput = TextEditingController();
  final pw2Input = TextEditingController();

  bool isIdFilled = false;
  bool isPasswordSame = false;
  bool isPwInputSizeLongEnough = false;
  bool isPw2InputSizeLongEnough = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5865f2),
      // appBar: AppBar(
      //   title: Text(' '),
      //   elevation: 0.0,
      //   backgroundColor: Color(0xff5865f2),
      //   centerTitle: true,
      //   // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      //   // actions: <Widget>[
      //   //   IconButton(icon: Icon(Icons.search), onPressed: () {})
      //   // ],
      // ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 130)),
          const Center(
            child: Text(
              'Fit\nYour\nDiscord',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Form(
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.grey,
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(40.0),
                // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                // SingleChildScrollView으로 감싸 줌
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Id'),
                        keyboardType: TextInputType.text,
                        controller: idInput,
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'PW'),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 비밀번호 안보이도록 하는 것
                        controller: pwInput,
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'PW2 (회원가입시 입력)'),
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
                                if (_formValidation()) {
                                  int? result = await register(idInput.text,
                                      pwInput.text, pw2Input.text);
                                  print(result);
                                  if (result == 201) {
                                    _showRegisterSuccessAlert();
                                  } else {
                                    String reason = '';
                                    reason += '\n- 이미 있는 Username일 수 있습니다.';
                                    reason +=
                                        '\n- Username을 수정해도 반복된다면 잠시 후 다시 시도해주세요.';
                                    _showRegisterFailAlert(reason);
                                  }
                                } else {
                                  String reason = '';
                                  if (!isIdFilled) {
                                    reason += '\n- ID 입력 안됨';
                                  }
                                  if (!isPasswordSame) {
                                    reason += '\n- 비밀번호 입력 불일치';
                                  }
                                  if (!isPwInputSizeLongEnough) {
                                    reason += '\n- 비밀번호 길이 부족(8자 이상)';
                                  }
                                  if (!isPw2InputSizeLongEnough) {
                                    reason += '\n- 확인 비밀번호 길이 부족(8자 이상)';
                                  }
                                  _showRegisterFailAlert(reason);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(120, 50),
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
                                int? result =
                                    await login(idInput.text, pwInput.text);
                                if (result == 200) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ServerList(),
                                    ),
                                  );
                                } else {
                                  // TODO: Pop-up Alert로 교체
                                  _showLoginFailAlert();
                                }
                                // String? token = await storage.read(key: 'token');
                                // print(token);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(120, 50),
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

  bool _formValidation() {
    isIdFilled = true;
    isPasswordSame = true;
    isPwInputSizeLongEnough = true;
    isPw2InputSizeLongEnough = true;

    if (idInput.text == '') {
      print('id input is not filled.');
      isIdFilled = false;
    }
    if (pwInput.text != pw2Input.text) {
      //TODO: pop-up
      print('password inputs are not same.');
      isPasswordSame = false;
    }
    if (pwInput.text.length < 8) {
      //TODO: pop-up
      print('pwInput length is less than 8.');
      isPwInputSizeLongEnough = false;
    }
    if (pw2Input.text.length < 8) {
      //TODO: pop-up
      print('pw2Input length is less than 8.');
      isPw2InputSizeLongEnough = false;
    }

    bool totalValidation = isIdFilled &&
        isPasswordSame &&
        isPwInputSizeLongEnough &&
        isPw2InputSizeLongEnough;
    return totalValidation;
  }

  void _showRegisterSuccessAlert() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: const Text("회원가입에 성공하였습니다."),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showRegisterFailAlert(String reason) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text("회원가입에 실패하였습니다.$reason"),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLoginFailAlert() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: const Text("로그인에 실패했습니다.\nID 또는 PW를 확인해주세요."),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
