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
