// import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

var serverIp = InternetAddress.loopbackIPv4.host;
var serverIpWithPort = '127.0.0.1:8000';
// var serverIp = "10.0.2.2"; // localhost for Android Simulator
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
    await storage.write(key: 'refresh', value: data['refresh']);
    await storage.write(key: 'token', value: data['access']);
  }
  return httpResponse.statusCode;
}

Future<int> register(var username, var password, var password2) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try Register");
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

  return httpResponse.statusCode;
}
// End of JWT API

// User API
Future<List> getUserList() async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try to get User list");
  serverPath = "/api/user/";

  String? token = await storage.read(key: 'token');
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.add('Authorization', 'Bearer $token');
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();

  var data = jsonDecode(httpResponseContent);
  print("data runtime type: ${data.runtimeType}");

  return data;
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

  print("|-> Try to get Server Detail");
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

// Success: ModifiedServerInfo, Fail: {}
Future<Map> editServerDetail(int serverId, String serverName, String serverUrl,
    String serverDescription, List newTags) async {
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
  if (httpResponse.statusCode == 200) {
    // Load old tags
    List oldTags = await getTagByServerId(serverId);

    // extract old tag names
    List oldTagNames = List.empty(growable: true);
    oldTags.forEach((oldTag) {
      oldTagNames.add(oldTag["tag_name"]);
    });

    // oldTag is not contained in newTags? Should be deleted : Remained
    for (var oldTag in oldTagNames) {
      if (!newTags.contains(oldTag)) {
        await deleteTag(serverId, oldTag);
      }
    }

    // newTag is not contained in oldTags? Should be created : Remained
    for (var newTag in newTags) {
      if (!oldTagNames.contains(newTag)) {
        await createTag(serverId, newTag);
      }
    }
    return await getServerDetail(serverId);
  } else {
    return {};
  }
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
Future<Map> createServer(String serverName, String serverUrl,
    String serverDescription, List tags) async {
  String? token = await storage.read(key: 'token');

  print("|-> Try to create Server");
  var url = Uri.http('127.0.0.1:8000', 'api/server/');
  var response = await http.post(url, headers: {
    "Authorization": 'Bearer $token'
  }, body: {
    "server_name": serverName,
    "server_url": serverUrl,
    "server_description": serverDescription
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 201) {
    var serverInfo = jsonDecode(response.body);
    // Server successfully created. Add tags.
    tags.forEach((tag) => createTag(serverInfo['server_id'], tag));
    return serverInfo;
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

// Success: 204, Fail: not 204
Future<int> deleteTag(int serverId, String tagName) async {
  String? token = await storage.read(key: 'token');

  print("|-> Try to delete Tag");
  var url = Uri.http(serverIpWithPort, 'api/tag/$serverId/');
  var response = await http.delete(url,
      headers: {"Authorization": 'Bearer $token'}, body: {"tag_name": tagName});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response.statusCode;
}

// Success: 201, Fail: not 201
Future<int> createTag(int serverId, String tagName) async {
  String? token = await storage.read(key: 'token');

  print("|-> Try to create Tag");
  var url = Uri.http(serverIpWithPort, 'api/tag/');
  var response = await http.post(url,
      headers: {"Authorization": 'Bearer $token'},
      body: {"server_id": serverId.toString(), "tag_name": tagName});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response.statusCode;
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

// Success: 204, Fail: not 204
Future<int> deleteLike(int serverId) async {
  String? token = await storage.read(key: 'token');

  print("|-> Try to delete like");
  var url = Uri.http(serverIpWithPort, 'api/like/');
  var response = await http.delete(url,
      headers: {"Authorization": 'Bearer $token'},
      body: {"server_id": serverId.toString()});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response.statusCode;
}

// Success: 201, Fail: not 201
Future<int> createLike(int serverId) async {
  String? token = await storage.read(key: 'token');

  print("|-> Try to create like");
  var url = Uri.http(serverIpWithPort, 'api/like/');
  var response = await http.post(url,
      headers: {"Authorization": 'Bearer $token'},
      body: {"server_id": serverId.toString()});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  return response.statusCode;
}

// End of Like API

// void printHttpContentInfo(var httpResponse, var httpResponseContent) {
//   print("|<- status-code    : ${httpResponse.statusCode}");
//   print("|<- content-type   : ${httpResponse.headers.contentType}");
//   print("|<- content-length : ${httpResponse.headers.contentLength}");
//   print("|<- content        : $httpResponseContent");
// }
