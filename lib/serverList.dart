import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';

class ServerList extends StatefulWidget {
  @override
  State<ServerList> createState() => _ServerListState();
}

class _ServerListState extends State<ServerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Server List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff5865f2),
        // centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: FutureBuilder(
        future: _displayServerList(),
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
            return ListView(children: snapshot.data!);
          }
        },
      ),
    );
  }

  Future<List<Widget>> _displayServerList() async {
    List<Widget> serverElements = [];
    List serverList = await getServerList();
    serverList.forEach((server) {
      serverElements.add(_convertToServerElement(server));
    });
    return serverElements;
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
      margin: EdgeInsets.all(10),
      width: 365.0,
      height: 95.0,
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
      child: Row(
        children: [
          Flexible(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(20),
              // color: Colors.deepPurple,
              // padding: ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    serverName.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    serverTagNames.toString(),
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
            flex: 2,
            child: Container(
              // color: Colors.amber,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 15),
                  Text(
                    serverLike.length.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              // color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Icon(Icons.keyboard_arrow_right, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
