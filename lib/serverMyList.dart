import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:discord_flutter/serverDetail.dart';

class ServerMyList extends StatefulWidget {
  @override
  State<ServerMyList> createState() => _ServerMyListState();
}

class _ServerMyListState extends State<ServerMyList> {
  List<Widget> _serverList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Server List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xff5865f2),
        // centerTitle: true,
      ),
      body: FutureBuilder(
        future: _initServerList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return const Center(
                  child: Text('Loading...'),
                );
              }
            case ConnectionState.done:
              {
                return RefreshIndicator(
                  // key: _refreshIndicatorKey,
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
      if (server["is_owner"] == "y") {
        serverElements.add(_convertToServerElement(server));
      }
    });
    _serverList = serverElements;
  }

  Future<void> _refreshServerList() async {
    List<Widget> serverElements = [];
    List serverList = await getServerList();
    serverList.forEach((server) {
      if (server["user_liked"] == "y") {
        serverElements.add(_convertToServerElement(server));
      }
    });
    setState(() {
      _serverList = serverElements;
    });
  }

  GestureDetector _convertToServerElement(Map server) {
    int serverId = server["server_id"];
    String serverName = server["server_name"];
    List serverLike = server["like"];

    List serverTagNames = [];
    List serverTag = server["tag"];
    serverTag.forEach(
      (tag) {
        serverTagNames.add('#' + tag["tag_name"]);
      },
    );

    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ServerDetail(serverId: serverId),
          ),
        );
        setState(() {}); // Refresh list
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 365.0,
        height: 95.0,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(29.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
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
                padding: const EdgeInsets.all(20),
                // color: Colors.deepPurple,
                // padding: ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      serverName.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      serverTagNames.toString(),
                      style: const TextStyle(
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
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite_border, size: 15),
                    Text(
                      serverLike.length.toString(),
                      style: const TextStyle(
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
                alignment: Alignment.center,
                child: const Icon(Icons.keyboard_arrow_right, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
