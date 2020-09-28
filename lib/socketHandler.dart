import 'package:socket_io_client/socket_io_client.dart';

class SocketHandler {

  Socket socket;

  SocketHandler(){
    connectToSocket();
  }

  connectToSocket(){
    socket = io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket']
    });
    socket.on('connect', (data) => print('connected!!!'));
  }

  emitStateChange(String state){
    print("state change: "+ "'"+state+"'");
    socket.emit('stateChange', state);
  }
}