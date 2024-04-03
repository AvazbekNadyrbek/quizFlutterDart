import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextResultQuestion extends StatelessWidget {
  const TextResultQuestion({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return const Text(
      data[question] as String,
      style: GoogleFonts.lato(color: Colors.white, fontSize: 15.0),
      textAlign: TextAlign.start,
    );
  }
}
