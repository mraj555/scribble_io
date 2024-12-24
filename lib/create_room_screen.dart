import 'package:flutter/material.dart';
import 'package:scribble_io/widgets/common_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  String? _maxRounds;
  String? _roomSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Title
          Text(
            "Create Room",
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
          SizedBox(height: 20),

          ///Max Rounds
          DropdownButton<String>(
            focusColor: Color(0xFFF5F6FA),
            hint: Text(
              "Select Max Rounds",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            items: <String>["2", "5", "10", "15"]
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList(),
            value: _maxRounds,
            onChanged: (value) => setState(() => _maxRounds = value),
          ),
          SizedBox(height: 20),

          DropdownButton<String>(
            focusColor: Color(0xFFF5F6FA),
            hint: Text(
              "Select Room Size",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            items: <String>["2", "3", "4", "5", "6", "7", "8"]
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList(),
            value: _roomSize,
            onChanged: (value) => setState(() => _roomSize = value),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            child: Text("Create"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16),
              minimumSize: Size(MediaQuery.of(context).size.width / 2.5, 50),
            ),
          ),
        ],
      ),
    );
  }
}
