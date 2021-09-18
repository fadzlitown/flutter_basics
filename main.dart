import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

/// int num; --> will be an error. should set a def value
int num = 0;

/// var num2; --> can init without def value
var num2;

class Person {
  String name = 'Max';
  int age = 30;
}

double addNumbers(double n1, double n2) {
  return n1 + n2;
}

void main() {
  // var person1 = Person();
  // var person2 = Person();
  // person1.name = 'Ali';
  //
  // print(person1.name);
  // print(person2.name);
  //
  // print(addNumbers(2.0, 3.0));

  //runApp -> provided by Flutter, ask to draw this widget on the screen
  runApp(MyApp());
}

/// Stateless Widget -> some widget does not do anything just SHOW TO UI / OUTPUT / STATIC UI. CAN'T CHANGE STATE!
/// in some usecase, we need a widget that can hold / update / change the data UI which having its own a STATE!
/// To create a StatefulWidget: need to create a seperate class (ONLY HANDLE A STATE!)
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // underscore _ meaning the private class (only can be used inside MyApp)
  }
}

/// Rules = 1 widget per 1 file

///NOTE:  using StatefulWidget, need to create a STATE CLASS BY EXTENDING STATE
/// The widget can be recreated, (UI RE-BUILD) that why we need state class seperated & can be recreated.
/// STATE == LIVEDATA in Android (keep the UI States)
class _MyAppState extends State<MyApp> {
  /// private class = _MyAppState
  /// internal data / private property = used _ "underscore" ONLY CAN BE USED IN FILE
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    //setState notify the flutter that the internal state of this object has changed, required UI rebuild for those widget that hold this variable
    //func force flutter to re-build / re-render the widget, will not redraw the whole widget tree--> but only the Text widget !
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Ni jawapanya!' + _questionIndex.toString());
    print(_questionIndex);
  }

  void _resetQuiz() {
    //will rebuild build Widget
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// NOTE:  const VS final
    /// const - KNOW THE VALUE & VALUE CANNOT BE CHANGED during COMPILE TIME CONST! NOT RUNTIMES CONST!
    /// final - DON'T KNOW THE VALUE (not logged in code) but initial, dynamic value can be assigned during RUNTIME TIME then CANNOT BE CHANGED after that.
    ///
    /// const _questions = variable into const, if we DONT WANT ASSIGN _questions VALUE TO CHANGE
    /// value into const =
    const _questions = [
      ///the value of the map can be anything !
      {
        'questionText': 'What is your husband best fav food?',
        'answers': [
          {'text': 'Ayam Penyet', 'score': 100},
          {'text': 'Nasi Ayam', 'score': 70},
          {'text': 'Nasi Goreng', 'score': 20},
        ]
      },
      {
        'questionText': 'What is your husband fav color ?',
        'answers': [
          {'text': 'Blue', 'score': 100},
          {'text': 'Red', 'score': 30},
          {'text': 'Black', 'score': 80},
        ]
      },
      {
        'questionText': 'What is your husband fav Sport?',
        'answers': [
          {'text': 'Badminton', 'score': 100},
          {'text': 'Dance', 'score': 50},
          {'text': 'Skipping', 'score': 80},
          {'text': 'Ping Pong', 'score': 90}
        ]
      }
    ];

    /** eg.
        final names = ['Max', 'Manu', 'Julie'];
        final result = names.map((name) => Text(name)).toList();

        map() returns a new iterable (which is transformed to a list via toList())
        where each value of the original list (names) is transformed as "described"
        by the function you pass to map. In this case, each name is wrapped into
        a Text() widget and then added to the new list which is stored in result.
     * */

    /** NOTE:
        VARIABLE const
        if "const _questions"
        const _questions = [...]
        _questions = []; Constant variables can't be assigned a value,
     * */
    /**
        VARIABLE VALUE const
        var dummy = const ['Hello'];
        dummy.add('value'); you cannot change the const value's
        /// Unsupported operation: add !! error
        print(dummy);
     */

    ///Scaffold - make a base app frame
    return MaterialApp(
        home: Scaffold(
      /// AppBar widget accepting, title widget called Text,
      appBar: AppBar(
        title: Text('My First App!'),
      ),

      /// body is accepting any widget tree below them.
      body: _questionIndex < _questions.length

          ///NOTE : SPLITTING the app into Widgets are RECOMMENDED & GOOD PRACTICES!
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
