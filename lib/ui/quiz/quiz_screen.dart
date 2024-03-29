import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  var questions = <Question>[
    Question(
        question: "Вы решили какую профессию выберете в будещем",
        options: <String>["Да", "Нет"]),
    Question(
        question: "Вы решили какую профессию выберете в будещем",
        options: <String>["Да", "Нет"]),
    Question(
        question: "Вы решили какую профессию выберете в будещем",
        options: <String>["Да", "Нет"])
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("Квест"),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          "Вопрос",
                          softWrap: true,
                          style: MediaQuery.of(context).size.width > 800
                              ? _questionStyle.copyWith(fontSize: 30.0)
                              : _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RadioListTile(
                          title: Text(
                            "What?",
                            style: MediaQuery.of(context).size.width > 800
                                ? TextStyle(fontSize: 30.0)
                                : null,
                          ),
                          groupValue: _answers[_currentIndex],
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              _answers[_currentIndex] = true;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            "What?",
                            style: MediaQuery.of(context).size.width > 800
                                ? TextStyle(fontSize: 30.0)
                                : null,
                          ),
                          groupValue: _answers[_currentIndex],
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              _answers[_currentIndex] = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        padding: MediaQuery.of(context).size.width > 800
                            ? const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 64.0)
                            : null,
                        // child: Text(
                        //   _currentIndex == (widget.questions.length - 1)
                        //       ? "Submit"
                        //       : "Next",
                        //   style: MediaQuery.of(context).size.width > 800
                        //       ? TextStyle(fontSize: 30.0)
                        //       : null,
                        // ),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    // if (_currentIndex < (widget.questions.length - 1)) {
    //   setState(() {
    //     _currentIndex++;
    //   });
    // } else {
    //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   //     builder: (_) => QuizFinishedPage(
    //   //         questions: widget.questions, answers: _answers)));
    // }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
