import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

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

///using StatefulWidget, need to create a STATE CLASS BY EXTENDING STATE
/// The widget can be recreated, (UI RE-BUILD) that why we need state class seperated & can be recreated.
/// STATE == LIVEDATA in Android (keep the UI States)
class _MyAppState extends State<MyApp> {
  //internal data / private data = used _ "underscore"
  var _questionIndex = 0;

  void _answerQuestion() {
    //setState notify the flutter that the internal state of this object has changed, required UI rebuild for those widget that hold this variable
    //func force flutter to re-build / re-render the widget, will not redraw the whole widget tree--> but only the Text widget !
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Ni jawapanya! 1');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['What is your fav color?', 'What is your fav animal?'];

    ///Scaffold - make a base app frame
    return MaterialApp(
        home: Scaffold(
      /// AppBar widget accepting, title widget called Text,
      appBar: AppBar(
        title: Text('My First App!'),
      ),

      /// body is accepting any widget tree below them.
      body: Column(children: [
        /// restructuring widget into smaller code,
        Question(questions[_questionIndex]),
        ElevatedButton(
          /// hover the onPressed --> {required void Function()? onPressed} "it needs a function but don't return anything!"
          /// when Flutter rendering this widget & onPressed, should not call with the function answerQuestion().
          /// used pointer name of the func answerQuestion instead (not result). "tell the flutter when it pressed, then only call answerQuestion() "
          onPressed: _answerQuestion,
          child: Text("Jawapan 1"),
        ),
        ElevatedButton(
          /// eg annonymous func - single line
          onPressed: () => print('Jawapan no 2'),
          child: Text("Jawapan 2"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        ElevatedButton(
          /// eg annonymous func
          onPressed: () {
            print('Jawapan no 3');
            print('Jawapan no another 3');
          },
          child: Text("Jawapan 3"),
        )
      ]),
    ));
  }
}
