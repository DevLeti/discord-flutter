import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:discord_flutter/serverDetail.dart';

class searchServer extends StatefulWidget {
  @override
  State<searchServer> createState() => _searchServerState();
}

class _searchServerState extends State<searchServer> {
  List<Widget> _serverList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Server search',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff5865f2),
      ),
      // TODO: 구현
      // 1. Column으로 나눈 후 Flexible로 Search와 Result 배치
      // 1-1. Search는 Row로 - Textfield와 Search(icon) Button 배치
      // 1-2. Result는 FutureBuilder - Textfield의 값을 넣어서 Search API 호출 - 나온 결과를 뿌려주기 - 어떻게?
      body: FutureBuilder(
        future: _initServerList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return Center(
                  child: Text('Loading...'),
                );
              }
            case ConnectionState.done:
              {
                return RefreshIndicator(
                  onRefresh: _refreshServerList,
                  child: ListView.builder(
                    itemCount: _serverList.length,
                    itemBuilder: (BuildContext context, index) {
                      return _serverList[index];
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Future<void> _initServerList() async {
    List<Widget> serverElements = [];
    List serverList = await getServerList();
    serverList.forEach((server) {
      serverElements.add(_convertToServerElement(server));
    });
    _serverList = serverElements;
  }

  Future<void> _refreshServerList() async {
    List<Widget> serverElements = [];
    List serverList = await getServerList();
    serverList.forEach((server) {
      serverElements.add(_convertToServerElement(server));
    });
    setState(() {
      _serverList = serverElements;
    });
  }

  GestureDetector _convertToServerElement(Map server) {
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

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ServerDetail(serverId: serverId),
          ),
        );
      },
      child: Container(
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
                        fontSize: 20,
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
      ),
    );
  }
}
