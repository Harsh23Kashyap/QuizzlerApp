import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/appBar.dart';

class Score extends StatefulWidget {
  int score = 0;
  int total = 0;
  Score(int s, int l) {
    score = s;
    total = l;
  }
  @override
  _ScoreState createState() => _ScoreState(score, total);
}

class _ScoreState extends State<Score> {
  int score = 0;
  int total = 0;
  _ScoreState(int s, int l) {
    score = s;
    total = l;
  }

  List<MaterialColor> colorizeColors = [
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.blue,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontFamily: 'SF',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "Score Card"),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 160),
          Center(
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText('Thank You',
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    scalingFactor: 0.2),
                ScaleAnimatedText('So Much!!!',
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    scalingFactor: 0.2),
              ],
            ),
          ),
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "Your Score is " +
                      score.toString() +
                      " out of " +
                      total.toString(),
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
          SizedBox(height: 200),
          Text("Made by Harsh...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20))
        ],
      ),
    );
  }
}
