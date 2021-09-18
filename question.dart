import 'package:flutter/material.dart';

//shortcut : sf to create a class

// if Question = public class, _Question is private class
///  is marked as '@immutable', but one or more of its instance fields aren't final:
class Question extends StatelessWidget {
  /// final - value NEVER CHANGE when app runs during RUNTIMES CONST VALUE!
  ///  writing this property we dont know what will be the final value
  /// eg. Question widget, there is not a single final value. but depends on the instances created
  final String questionText; //properties

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      ///get as much width of the screen
      width: double.infinity,

      /// spacing around container
      margin: EdgeInsets.all(10.0),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
