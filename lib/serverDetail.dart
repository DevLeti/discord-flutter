import 'package:flutter/material.dart';
import 'package:discord_flutter/API.dart';
import 'package:url_launcher/url_launcher.dart';

class ServerDetail extends StatefulWidget {
  final int serverId;
  const ServerDetail({required this.serverId, Key? key}) : super(key: key);

  @override
  State<ServerDetail> createState() => _ServerDetailState();
}

class _ServerDetailState extends State<ServerDetail> {
  String serverName = "";
  String serverUrl = "";
  String serverDescription = "";
  int serverCreator = -1;
  List serverLike = [];
  int likeCount = -1;
  bool isLiked = false;
  bool isOwner = false;

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

  // Server에 Like 추가/삭제 요청, like 버튼 setState by change isLiked variable
  void _changeLikeState() async {
    if (isLiked == true) {
      await deleteLike(widget.serverId);
    } else {
      await createLike(widget.serverId);
    }
    setState(() {
      if (isLiked == true) {
        isLiked = false;
      } else {
        isLiked = true;
      }
    });
    print(isLiked);
  }

  Container _convertToServerElement(Map server) {
    // int serverId = server["server_id"];
    serverName = server["server_name"];
    serverUrl = server["server_url"];
    serverDescription = server["server_description"];
    serverCreator = server["user_id"];

    serverLike = server["like"];
    likeCount = serverLike.length;
    isLiked = (server["user_liked"] == "y") ? true : false;
    isOwner = (server["is_owner"] == "y") ? true : false;

    List serverTagNames = [];
    List serverTag = server["tag"];
    serverTag.forEach(
      (tag) {
        serverTagNames.add('#' + tag["tag_name"]);
      },
    ); // 간접적으로 Edit 버튼 활성여부 결정

    return Container(
      margin: EdgeInsets.all(16),
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
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
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
                  Flexible(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Container(
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
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$likeCount',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          isLiked
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.favorite,
                                    size: 18,
                                  ),
                                  color: Colors.red,
                                  onPressed: _changeLikeState,
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                  ),
                                  onPressed: _changeLikeState,
                                ),
                        ],
                      ),
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
