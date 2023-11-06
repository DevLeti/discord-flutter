// import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

var serverIp = InternetAddress.loopbackIPv4.host;
// var serverIp = "10.0.2.2";
var serverPort = 8000;
var serverPath;

var httpClient = HttpClient();
var httpResponseContent;

final storage = new FlutterSecureStorage();

// JWT API
Future<int> login(var username, var password) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try Login");
  // try {
  Map jsonContent = {'username': username, 'password': password};
  var content = jsonEncode(jsonContent);
  serverPath = "/api/login/";
  // httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  print(httpResponse.statusCode);
  if (httpResponse.statusCode == 200) {
    var data = jsonDecode(httpResponseContent);
    // print("data runtime type: ${data.runtimeType}");
    // print("refresh: ${data['refresh']}\naccess: ${data['access']}");
    // Obtain shared preferences.
    await storage.write(key: 'refresh', value: data['refresh']);
    await storage.write(key: 'token', value: data['access']);
  }
  return httpResponse.statusCode;
  // } catch (e) {
  //   rethrow;
  // }
  // printHttpContentInfo(httpResponse, httpResponseContent);
}

Future<int> register(var username, var password, var password2) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try Login");
  Map jsonContent = {
    'username': username,
    'password': password,
    'password2': password2
  };
  var content = jsonEncode(jsonContent);
  serverPath = "/api/register/";
  // httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  // var data = jsonDecode(httpResponseContent);
  // print("data runtime type: ${data.runtimeType}");
  // print("refresh: ${data['refresh']}\naccess: ${data['access']}");

  return httpResponse.statusCode;
  // printHttpContentInfo(httpResponse, httpResponseContent);
}
// End of JWT API

// User API
Future<List> getUserList() async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get User list");
  // Map jsonContent = {
  // };
  // var content = jsonEncode(jsonContent);
  serverPath = "/api/user/";
  // httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  var data = jsonDecode(httpResponseContent);
  print("data runtime type: ${data.runtimeType}");
  // print("refresh: ${data['refresh']}\naccess: ${data['access']}");

  return data;
  // printHttpContentInfo(httpResponse, httpResponseContent);
}
// End of User API

// Server API
// Success: ServerList, Fail: []
Future<List> getServerList() async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Server list");
  serverPath = "/api/server/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}

// Success: serverDetail, Fail: {}
Future<Map> getServerDetail(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Server list");
  serverPath = "/api/server/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return {};
  }
}

// TODO: Tag도 수정 가능하도록 구현
// Success: 200, Fail: not 200
Future<int> editServerDetail(int serverId, String serverName, String serverUrl,
    String serverDescription, List<Map> tags) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to edit Server list");
  Map jsonContent = {
    'server_name': serverName,
    'server_url': serverUrl,
    'server_description': serverDescription
  };
  var content = jsonEncode(jsonContent);
  serverPath = "/api/server/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.put(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  // var data = jsonDecode(httpResponseContent);

  return httpResponse.statusCode;
}

// Success: 204, Fail: not 204
Future<int> deleteServer(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to delete Server");
  serverPath = "/api/server/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.delete(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json;
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  return httpResponse.statusCode;
}

// Success: createdServerDetail, Fail: {}
// TODO: Success일 때 List로 받은 tag 각각 foreach로 create 하도록 설정
Future<Map> createServer(String serverName, String serverUrl,
    String serverDescription, List tags) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to create Server");
  Map jsonContent = {
    'server_name': serverName,
    'server_url': serverUrl,
    'server_description': serverDescription
  };
  var content = jsonEncode(jsonContent);
  serverPath = "/api/server/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 201) {
    // TOOO: tag 각각 create하기
    return jsonDecode(httpResponseContent);
  } else {
    return {};
  }
}

// Success: serverList, Fail: []
Future<List> searchServer(String searchKeyword) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Server list");
  serverPath = "/api/search/$searchKeyword/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}
// End of Server API

// Tag API
Future<List> getTagList() async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Tag list");
  serverPath = "/api/tag/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}

// Success: tag list of serverId, Fail: []
Future<List> getTagByServerId(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Tag By ServerId");
  serverPath = "/api/tag/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}

// TODO: 500 bug 수정
Future<int> deleteTag(int serverId, String tagName) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to delete Tag");
  Map jsonContent = {'tag_name': tagName};
  var content = jsonEncode(jsonContent);
  serverPath = "/api/tag/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.delete(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  return httpResponse.statusCode;
}

// TODO: 500 버그 수정
Future<int> createTag(int serverId, String tagName) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to create Tag");
  Map jsonContent = {'server_id': serverId, 'tag_name': tagName};
  var content = jsonEncode(jsonContent);
  serverPath = "/api/tag/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  return httpResponse.statusCode;
}
// End of Tag API

// Like API
Future<List> getLikeList() async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get Like list");
  serverPath = "/api/like/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}

Future<List> getLikeByServerId(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get like By ServerId");
  serverPath = "/api/like/$serverId/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  if (httpResponse.statusCode == 200) {
    return jsonDecode(httpResponseContent);
  } else {
    return [];
  }
}

// TODO: delete 실패 수정
Future<int> deleteLike(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to delete like");
  Map jsonContent = {
    'server_id': serverId,
  };
  var content = jsonEncode(jsonContent);
  serverPath = "/api/like/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.delete(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  return httpResponse.statusCode;
}

// TODO: post 실패 수정
Future<int> createLike(int serverId) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to create like");
  Map jsonContent = {
    'server_id': serverId,
  };
  var content = jsonEncode(jsonContent);
  serverPath = "/api/like/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token')
    ..headers.contentType = ContentType.json
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  return httpResponse.statusCode;
}

// End of Like API

// Future main() async {
//   var response = await login('admin', 'admin');
//   if (response == 200) {
//     String? refresh = await storage.read(key: 'refresh');
//     String? access = await storage.read(key: 'access');
//     print(refresh);
//     print(access);
//   }
// }

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
