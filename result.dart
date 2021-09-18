import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  // final VoidCallback resetQuiz; or below
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String getResultScore() {
    var resultText = 'You did it! ';

    if (totalScore >= 230) {
      resultText = 'You are awesome!!';
    } else if (totalScore < 230 && totalScore >= 150) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            getResultScore() +
                '\nTotal Score : ' +
                totalScore.toString() +
                ' /300',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          FlatButton(
              onPressed: resetQuiz, child: Text('Restart'), color: Colors.blue)
        ],
      ),
    );
  }
}
