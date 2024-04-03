import 'package:flutter/material.dart';
import 'package:udemy_chanlage/data/questions.dart';
import 'package:udemy_chanlage/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.restartQuiz,
    required this.chosenAnswers,
  });

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You answered $correctQuestions out of $numberTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              icon:
                  const Icon(Icons.restart_alt_sharp), // Icon widget goes here
              label: const Text('Restart Quiz!'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(
                    255, 55, 19, 117)), // Set background color to transparent
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 255, 255)),
              ), // Text widget goes here
            ),
          ],
        ),
      ),
    );
  }
}
