import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
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

///NOTE:  using StatefulWidget, need to create a STATE CLASS BY EXTENDING STATE
/// The widget can be recreated, (UI RE-BUILD) that why we need state class seperated & can be recreated.
/// STATE == LIVEDATA in Android (keep the UI States)
class _MyAppState extends State<MyApp> {
  /// private class = _MyAppState
  /// internal data / private property = used _ "underscore" ONLY CAN BE USED IN FILE
  var _questionIndex = 0;

  String _answerQuestion() {
    //setState notify the flutter that the internal state of this object has changed, required UI rebuild for those widget that hold this variable
    //func force flutter to re-build / re-render the widget, will not redraw the whole widget tree--> but only the Text widget !
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Ni jawapanya!' + _questionIndex.toString());
    print(_questionIndex);
    return 'Ni jawapanya!' + _questionIndex.toString();
  }

  @override
  Widget build(BuildContext context) {
    /// NOTE:  const VS final
    /// const - KNOW THE VALUE & VALUE CANNOT BE CHANGED during COMPILE TIME CONST! NOT RUNTIMES CONST!
    /// final - DON'T KNOW THE VALUE (not logged in code) but initial, dynamic value can be assigned during RUNTIME TIME then CANNOT BE CHANGED after that.
    ///
    /// const questions = variable into const, if we DONT WANT ASSIGN questions VALUE TO CHANGE
    /// value into const =
    const questions = [
      ///the value of the map can be anything !
      {
        'questionText': 'What is your fav color?',
        'answers': ['Black', 'Red', 'Blue']
      },
      {
        'questionText': 'What is your fav animal?',
        'answers': ['Rabbit', 'Snake', 'Dog']
      },
      {
        'questionText': 'What is your fav hobbies?',
        'answers': ['Football', 'Badminton', 'Dance', 'Bicycle', 'Racing']
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
        if "const questions"
        const questions = [...]
        questions = []; Constant variables can't be assigned a value,
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
      body: _questionIndex < questions.length
          ? Column(children: [
              /// restructuring widget into smaller code,
              /// in sdk: ">=2.12.0" --> need to tell Flutter this will never null then, used as String at the end
              Question(questions[_questionIndex]['questionText']),

              /// NOTE: MAP LISTS inside WIDGET: need a dynamic answers - since we do have dynamic values
              /// map thrown error w/out "as List<String>" bcs Dart can't read the answers inside the map string. then, cast it by telling Dart we expecting List of string
              /// new ... = spread operator does take a list, then pull all the values out of it, then add them into individual values. mcm foreach!!
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                ///need to return a widget
                return Answer(_answerQuestion, answer);
              }).toList()
            ])
          : Center(
              child: Text('You did it!'),
            ),
    ));
  }
}
