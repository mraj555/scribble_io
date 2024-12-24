import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late Socket _socket;

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

    ///Listening for events
    _socket.onConnect(
      (data) => log("$data", name: "Socket Data"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
