import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Image.asset('assets/images/User 07a.png'),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Choose Your\n      Game\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "Team Play",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "4 or more players\n",
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildButton('Football', 'assets/images/football.png',
                          Color(0xff016F13)),
                      SizedBox(height: 10),
                      _buildButton('Basketball', 'assets/images/basket.png',
                          Color(0xffFF725E)),
                      SizedBox(height: 10),
                      _buildButton('Tennis', 'assets/images/tennis.png',
                          Color(0xffFF9B29)),
                      SizedBox(height: 10),
                      _buildButton('Volleyball', 'assets/images/volley.png',
                          Color(0xffF6B000)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Individual Play",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "1 or more players\n",
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildButton('Skydiving', 'assets/images/sky.png',
                          Color(0xffE166CB)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(String text, String assetPath, Color color) {
  return ElevatedButton(
    onPressed: () {
      // Button action here
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 24,
            ),
          ),
          Image.asset(
            assetPath,
            width: 70,
            height: 70,
          ),
        ],
      ),
    ),
  );
}
