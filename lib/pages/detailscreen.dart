import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class DetailScreen extends StatefulWidget {
  final Color? statusColor;
  final double value;
  final String text;
  final String status;
  const DetailScreen(
      {super.key,
      this.statusColor,
      required this.value,
      required this.text,
      required this.status});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            //alignment: Alignment.topCenter,
            width: 350,
            height: 500,
            margin: EdgeInsets.only(top: 60, left: 30, right: 30),
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(135, 187, 187, 187),
                      spreadRadius: 1,
                      blurRadius: 30,
                      blurStyle: BlurStyle.outer,
                      offset: Offset.fromDirection(2))
                ]),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Your BMI is",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4B4B4B)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    widget.value.toStringAsFixed(2),
                    style: TextStyle(
                        color: Color(0xff66CFA6),
                        fontWeight: FontWeight.bold,
                        fontSize: 62),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 270,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(top: 4),

                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 250,
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          "assets/female-doctor.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      ChatBubble(
                        clipper:
                            ChatBubbleClipper1(type: BubbleType.receiverBubble),
                        backGroundColor: widget.statusColor,
                        margin: EdgeInsets.only(top: 30),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                                color: Color.fromARGB(255, 43, 43, 43),
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
