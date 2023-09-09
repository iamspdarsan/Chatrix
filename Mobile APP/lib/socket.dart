import 'dart:convert';
import 'dart:io';

Future<void> sendCommand(String command) async {
  var host = InternetAddress('192.168.29.23');
  var port = 80;

  // Connect to the server
  Socket clientSocket = await Socket.connect(host, port);
  clientSocket.write(command);
//  await clientSocket.flush();
  await clientSocket.close();
}

Future<String?> getState() async {
  var host = '192.168.29.23';
  var port = 80;

  var socket = await Socket.connect(host, port);
  socket.write('9');

  // Receive and print the response
  var response = '';
  await for (var data in socket) {
    response += utf8.decode(data);
  }
  response = response.trim();
  //print('Received: $response');
  // Close the connection
  socket.close();
  return response;
}
