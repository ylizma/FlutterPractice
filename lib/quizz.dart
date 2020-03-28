import 'package:flutter/material.dart';

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int currentQuestion = 0;
  int score = 0;
  final quiz = [
    {
      'title': 'question1',
      'answers': [
        {'answer': 'answer1', 'correct': false},
        {'answer': 'answer2', 'correct': true}
      ]
    },
    {
      'title': 'question2',
      'answers': [
        {'answer': 'answer1', 'correct': true},
        {'answer': 'answer2', 'correct': false}
      ]
    },
    {
      'title': 'question3',
      'answers': [
        {'answer': 'answer1', 'correct': false},
        {'answer': 'answer2', 'correct': true}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body:
        (this.currentQuestion>=quiz.length)?
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Score :${((score/quiz.length)*100).round()} %",style: TextStyle(fontSize: 22,color: Colors.deepOrange),),
              MaterialButton(
                onPressed: (){
                  setState(() {
                    this.score=0;
                    this.currentQuestion=0;
                  });
                },
                child: Text("restart..."),
                textColor: Colors.white,
                color:Colors.deepOrange ,
              )
            ],
          )
        )
        :
        ListView(
          children: <Widget>[
            ListTile(
              title: Center(
                  child: Text(
                "Question ${currentQuestion + 1} / ${quiz.length}",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              )),
            ),
            ListTile(
              title: Text(
                quiz[currentQuestion]['title'],
                style: TextStyle(fontSize: 22),
              ),
            ),
            ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if(answer['correct']==true) ++score;
                        ++currentQuestion;
                      });
                    },
                    child: Text(answer['answer'],style: TextStyle(color: Colors.white),),
                    color: Colors.orange,
                  ),
                ),
              );
            })
          ],
        ));
  }
}
