import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data['user_answer'] as String ==
                          data['correct_answer'] as String)
                        CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              const Color.fromARGB(255, 58, 83, 183),
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ),
                      if (data['user_answer'] as String !=
                          data['correct_answer'] as String)
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 16.0),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              data['user_answer'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 241, 143, 241),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              data['correct_answer'] as String,
                              style: GoogleFonts.lato(color: Colors.blue[400]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
