import 'dart:collection';

import 'package:socket_io_client/socket_io_client.dart';

class SocketHandler {

  Socket socket;
  Function setState;
  SocketHandler(Function setState){
    this.setState = setState;
    connectToSocket();
  }

  connectToSocket(){
    socket = io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket']
    });
    socket.on('connect', (data) => print('connected!!!'));
    socket.on('stateChange', (state) => {handleStateChange(state)});
  }

  handleStateChange(Map<String, dynamic> state) {
    try {
      print("STATE: "+state['state']);
      setState(state['state']);
    }
    catch(e) {
      print(e);
    }
  }

  emitStateChange(String state){
    print("state change: "+ "'"+state+"'");
    socket.emit('stateChange', state);
  }
}