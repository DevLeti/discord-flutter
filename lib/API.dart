import 'dart:io';
import 'dart:convert';

var serverIp = InternetAddress.loopbackIPv4.host;
var serverPort = 8000;
var serverPath;

var httpClient = HttpClient();
var httpResponseContent;

Future main() async {
  var tokens = await register('test3', 'testpwpwpw', 'testpwpwpw');
  print(tokens);
}

Future<Map> login(var username, var password) async {
  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> Try Login");
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

  var data = jsonDecode(httpResponseContent);
  // print("data runtime type: ${data.runtimeType}");
  // print("refresh: ${data['refresh']}\naccess: ${data['access']}");

  return data;
  // printHttpContentInfo(httpResponse, httpResponseContent);
}

Future<Map> register(var username, var password, var password2) async {
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

  var data = jsonDecode(httpResponseContent);
  // print("data runtime type: ${data.runtimeType}");
  // print("refresh: ${data['refresh']}\naccess: ${data['access']}");

  return data;
  // printHttpContentInfo(httpResponse, httpResponseContent);
}

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
