import 'dart:io';
import 'dart:convert';
import 'dart:async';


void main() async {
  const String op = '9';
    await sendCommand(op);}

Future<void> sendCommand(String command) async {
  var host = InternetAddress('192.168.29.23');
  var port = 80;

  // Connect to the server
  Socket clientSocket = await Socket.connect(host, port);
  clientSocket.write(utf8.encode(command));
  await clientSocket.flush();

/* 
  await clientSocket.listen(
    (event) {
      String message = String.fromCharCodes(event);
      print(message);});
 */
 final stream = clientSocket.transform(StreamTransformer.fromHandlers(handleData: (data, sink)
  {sink.add(utf8.decode(data));},)); // Transform the incoming bytes to a string and split by lines
  await for (final line in stream) {
    print(line);
  }

  await clientSocket.close();
  print('destroyed');
}
