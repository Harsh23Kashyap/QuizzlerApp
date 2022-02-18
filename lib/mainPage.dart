import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/ScoreCard.dart';

import 'main.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    "Is Mount Kilimanjaro the world’s tallest peak? ",
    "Venezuela is home to the world’s highest waterfall. ",
    "The capital of Australia is Sydney. ",
    "The longest river in the world is the Amazon River. ",
    "Bananas are curved due to their upward growth toward the light. ",
    "The Atlantic Ocean is the world’s biggest ocean. ",
    "Nepal is the only country in the world without a rectangular flag.",
    "Polar bears can only live in the Arctic region, not in the Antarctic. ",
    "Coffee is a berry-based beverage. ",
    "In Scotland, the unicorn is their national animal. ",
    "Done"
  ];
  int score = 0;
  List<bool> answer = [
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    true,
    true
  ];
  void check(bool picked, int questionNumber) {
    if (picked == answer[questionNumber]) {
      score = score + 1;
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    number = number + 1;
  }

  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(questions[number],
                      textStyle: TextStyle(color: Colors.white, fontSize: 30),
                      curve: Curves.easeIn,
                      speed: Duration(milliseconds: 20)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              splashColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  check(true, number);
                });
                if (number == answer.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Score(score, answer.length)),
                  );
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              splashColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  check(false, number);
                });
                if (number == answer.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Score(score, answer.length)),
                  );
                }
              },
            ),
          ),
        ),
        Row(children: scoreKeeper),
        Text(
          "Current Score - " +
              score.toString() +
              " out of " +
              number.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
