import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'main.dart';
import 'replay_page.dart';

import 'characters.dart';

class MentionWidget extends StatelessWidget {
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
      child:
          Text('Score : $score', style: Theme.of(context).textTheme.headline5),
    );
  }
}

class Question {
  Character _answer;
  List<Character> _potentialAnswers;

  Question() {
    allCharacters.shuffle();

    _potentialAnswers = new List<Character>();
    for (int i = 0; i < 4; ++i) {
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
  static int _score = 0;
  static int _nbreQuestions = 20;

  AudioPlayer audioPlayer = AudioPlayer();


  Future<ByteData> _getLocalPath(String filename) async {
    return await rootBundle.load("assets/sons/$filename.wav");
  }

  _playLocal(String filename) async {
    final file = new File('${(await getTemporaryDirectory()).path}/$filename.wav');
    await file.writeAsBytes((await _getLocalPath(filename)).buffer.asUint8List());
    await audioPlayer.play(file.path, isLocal: true, volume: 1.0);
  }

  _goodAnswer() async{
    await _playLocal("son_good_answer");
  }


  _badAnswer() async{
    await _playLocal("son_bad_answer");
  }

  _stop() async {
    await audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    _question = new Question();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    List<SizedBox> answerButtons = _question.potentialAnswers
        .map((e) => _createAnswerButton(e.getName(), () {
              _checkAnswer(e);
            }))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            _resetScoreAndNbreQuestions();
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (BuildContext context) {
              return new MyHomePage();
            }));
          },
        ),
        title: Text("Quiz animés et mangas"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: _screenWidth,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      print("onTap image!");
                    },
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
                    Text("${20 - _nbreQuestions + 1} / 20"),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [answerButtons[0], answerButtons[1]],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [answerButtons[2], answerButtons[3]],
                    ),
                    SizedBox(height: _screenHeight / 20.0),
                    (mention == null) ? SizedBox() : mention,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DisplayScoreWidget(score: _score),
    );
  }

  SizedBox _createAnswerButton(String text, Function onPressed) {
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

  _checkAnswer(Character c){
    setState(() {
      bool _isRightAnswer = c == _question.answer;
      mention = MentionWidget(state: _isRightAnswer);
      _score = _isRightAnswer ? _score + 1 : _score;
      if(_isRightAnswer){
        _goodAnswer();
      } else {
        _badAnswer();
      }
    });

    _nextGame();
  }

  _nextGame() {
    --_nbreQuestions;
    if (_nbreQuestions > 0) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => new PlayPage()));
    } else {
      int tmpScore = _score;
      _resetScoreAndNbreQuestions();
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => ReplayPage(tmpScore)));
    }
  }

  _resetScoreAndNbreQuestions() {
    _score = 0;
    _nbreQuestions = 20;
  }
}
