import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';

class ServerEdit extends StatefulWidget {
  final int serverId;
  const ServerEdit({required this.serverId, Key? key}) : super(key: key);
  @override
  State<ServerEdit> createState() => _ServerEditState();
}

class _ServerEditState extends State<ServerEdit> {
  TextEditingController serverName = TextEditingController();
  TextEditingController serverUrl = TextEditingController();
  TextEditingController serverDescription = TextEditingController();
  TextEditingController serverTag = TextEditingController();

  @override
  void initState() {
    super.initState();

    _getServerDetail(widget.serverId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Server Edit',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff5865f2),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(29.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
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
                            decoration:
                                const InputDecoration(labelText: 'Server Name'),
                            keyboardType: TextInputType.text,
                            controller: serverName,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Server Tag(스페이스바로 구분)'),
                            keyboardType: TextInputType.text,
                            controller: serverTag,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Server Url(Discord)'),
                            keyboardType: TextInputType.text,
                            controller: serverUrl,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Server Description',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Color(0xff5865f2),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Color(0xff5865f2),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            controller: serverDescription,
                            maxLines: 10,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      Map result = await editServerDetail(
                          widget.serverId,
                          serverName.text,
                          serverUrl.text,
                          serverDescription.text,
                          serverTag.text.split(' '));
                      if (result.isNotEmpty) {
                        _showSuccessAlert();
                      } else {
                        _showFailAlert();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        //모서리를 둥글게
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0xff5865f2),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Edit Server',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getServerDetail(int serverId) async {
    Map serverDetail = await getServerDetail(serverId);
    serverName.text = serverDetail["server_name"];
    serverUrl.text = serverDetail["server_url"];
    serverDescription.text = serverDetail["server_description"];

    List tags = serverDetail["tag"];
    List tagNames = [];
    tags.forEach((tag) {
      tagNames.add(tag["tag_name"]);
    });
    serverTag.text = tagNames.join(' ');
  }

  void _showSuccessAlert() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: const Text("서버 수정에 성공하였습니다!"),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop(); // Pop AlertDialog
                Navigator.of(context).pop(); // Pop serverEdit
                Navigator.of(context).pop(); // Pop serverDetail
              },
            ),
          ],
        );
      },
    );
  }

  void _showFailAlert() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: const Text("서버 수정에 실패하였습니다.\n다시 한번 시도해 주세요."),
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
