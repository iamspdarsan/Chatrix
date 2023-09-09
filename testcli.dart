import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

void main() async {
  while (true) {
    String inp = stdin.readLineSync()![0];
    await sendCommand(inp);
  }
}

Future<void> sendCommand(String command) async {
  var host = InternetAddress('192.168.29.23');
  var port = 80;

  // Connect to the server
  Socket clientSocket = await Socket.connect(host, port);
  clientSocket.write(command);
  await clientSocket.flush();
  clientSocket.destroy();
  //await clientSocket.close();
}
