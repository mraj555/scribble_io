import 'package:flutter/material.dart';
import 'package:scribble_io/widgets/common_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Title
          Text(
            "Join Room",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),

          ///Name
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CommonTextField(
              controller: _nameController,
              hintText: "Enter Your Name",
            ),
          ),
          SizedBox(height: 20),

          ///Room
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CommonTextField(
              controller: _roomController,
              hintText: "Enter Room Name",
            ),
          ),

          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16),
              minimumSize: Size(MediaQuery.of(context).size.width / 2.5, 50),
            ),
            child: Text("Join"),
          ),
        ],
      ),
    );
  }
}
