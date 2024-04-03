import 'package:flutter/material.dart';
import 'package:udemy_chanlage/data/questions.dart';
import 'package:udemy_chanlage/question_screen.dart';
import 'package:udemy_chanlage/start_screen.dart';
import 'package:udemy_chanlage/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switschScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'start';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(switschScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'start') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 55, 19, 117),
                Color.fromARGB(255, 126, 70, 221),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
