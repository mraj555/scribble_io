import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PaintScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  final String screenFrom;
  const PaintScreen({
    super.key,
    required this.data,
    required this.screenFrom,
  });

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late Socket _socket;
  String dataOfRoom = "";
  @override
  void initState() {
    super.initState();
    connect();
  }

  ///Functionality For Socket io Client Connection
  void connect() {
    _socket = io(
      'http://192.168.31.175:3000',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );
    _socket.connect();

    if (widget.screenFrom == 'CreateRoom') {
      _socket.emit('create-game', widget.data);
    }

    ///Listening for events
    _socket.onConnect(
      (data) {
        _socket.on(
          'updateRoom',
          (roomData) {
            setState(() {
              dataOfRoom = roomData;
            });
            if (roomData['isJoin'] != true) {
              //start the timer
            }
          },
        );
        log("$data", name: "Socket Data");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
