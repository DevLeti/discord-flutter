import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:url_launcher/url_launcher.dart';

class ServerDetail extends StatefulWidget {
  // TODO: serverId 받아오는거 테스트
  final int serverId;
  const ServerDetail({required this.serverId, Key? key}) : super(key: key);

  @override
  State<ServerDetail> createState() => _ServerDetailState();
}

class _ServerDetailState extends State<ServerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Server Information',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff5865f2),
        // centerTitle: true,
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.search), onPressed: () {})
        // ],
      ),
      body: FutureBuilder(
        future: _getServerDetail(widget.serverId),
        builder: (context, snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
          if (snapshot.hasData == false) {
            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
          }

          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15),
              ),
            );
          }

          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
          else {
            return snapshot.data!;
          }
        },
      ),
    );
  }

  Future<Widget> _getServerDetail(int serverId) async {
    Container serverDetail =
        _convertToServerElement(await getServerDetail(serverId));
    return serverDetail;
  }

  Container _convertToServerElement(Map server) {
    print('server_id : ${server["server_id"]}');
    print('server_name : ${server["server_name"]}');
    print('server_url : ${server["server_url"]}');
    print('server_description : ${server["server_description"]}');
    print('user_id : ${server["user_id"]}');
    print('like : ${server["like"]}');
    print('tag : ${server["tag"]}');

    int serverId = server["server_id"];
    String serverName = server["server_name"];
    String serverUrl = server["server_url"];
    String serverDescription = server["server_description"];
    int serverCreator = server["user_id"];
    List serverLike = server["like"];

    List serverTagNames = [];
    List serverTag = server["tag"];
    serverTag.forEach(
      (tag) {
        serverTagNames.add('#' + tag["tag_name"]);
      },
    );

    print(
        '$serverId $serverName $serverUrl $serverDescription $serverCreator $serverLike $serverTag');

    return Container(
      margin: EdgeInsets.all(16),
      // width: 365.0,
      // height: 95.0,
      child: Column(
        children: [
          Flexible(
            flex: 8,
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
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.blueAccent,
                      padding: EdgeInsets.all(20),
                      // color: Colors.deepPurple,
                      // padding: ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            serverName.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            serverTagNames.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      child: Container(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                '서버 설명',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 9,
                              child: Text(
                                serverDescription,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontFamily: 'SF Pro',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.blueAccent,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // TODO: User에 따라 Like 유무 확인, 반응형 적용
                          Text(
                            serverLike.length.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            size: 18,
                          ),
                        ],
                      ),
                      // TODO: ADD Server Button
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(serverUrl),
                    );
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
                    'Add Server',
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
    );
  }
}
