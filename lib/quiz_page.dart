import 'package:flutter/material.dart';
import 'replay_page.dart';

import 'characters.dart';

class MentionWidget extends StatelessWidget{
  const MentionWidget({this.state});
  final bool state;

  @override
  Widget build(BuildContext context) {
    IconData icon = state ? Icons.check_circle : Icons.clear;
    Color color = state ? Colors.green : Colors.red;
    double size = 60.0;
    return Icon(icon, color: color, size: size);
  }

}

class DisplayScoreWidget extends StatelessWidget {
  const DisplayScoreWidget({this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text('Score : $score',
      style: Theme.of(context).textTheme.headline5),
    );
  }
}

class Question {
  Character _answer;
  List<Character> _potentialAnswers;

  Question() {
    allCharacters.shuffle();

    _potentialAnswers = new List<Character>();
    for(int i = 0; i < 4; ++i){
      _potentialAnswers.add(allCharacters[i]);
    }

    _answer = _potentialAnswers[0];
    _potentialAnswers.shuffle();
  }

  Character get answer {
    return _answer;
  }

  List<Character> get potentialAnswers {
    return _potentialAnswers;
  }
}

class PlayPage extends StatefulWidget {
  @override
  _PlayPage createState() => _PlayPage();
}

class _PlayPage extends State<PlayPage> {
  Question _question;

  MentionWidget mention;
  static int score = 0;
  static int nbreQuiz = 20;

  @override
  void initState() {
    super.initState();
    _question = new Question();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    List<SizedBox> answerButtons = _question.potentialAnswers.map((e) =>
        _createAnswerButton(e.getName(), () { _checkAnswer(e); })).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 10.0,
        title: Text("Quiz animés et mangas"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: _screenWidth,
                child: Center(
                  child: Card(
                    elevation: 10.0,
                    child: Image.asset(
                      _question.answer.getImage(),
                      width: _screenWidth / 1.25,
                      height: _screenHeight / 1.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: _screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [answerButtons[0], answerButtons[1]],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [answerButtons[2], answerButtons[3]],
                    ),
                    SizedBox(height: _screenHeight / 12.0),
                    (mention == null) ? SizedBox() : mention,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DisplayScoreWidget(score: score),
    );
  }

  SizedBox _createAnswerButton (String text, Function onPressed) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _checkAnswer(Character c) {
    setState(() {
      bool _isRightAnswer = c == _question.answer;
      mention = MentionWidget(state: _isRightAnswer);
      score = _isRightAnswer ? score + 1 : score;
    });

    _nextGame();
  }

  void _nextGame() {
    --nbreQuiz;
    if(nbreQuiz > 0) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute
        (builder: (BuildContext context) => new PlayPage()));
    } else {
      int tmpScore = score; score = 0; nbreQuiz = 3;
      Navigator.of(context).pushReplacement(new MaterialPageRoute
        (builder: (BuildContext context) => ReplayPage(tmpScore)));
    }
  }
}