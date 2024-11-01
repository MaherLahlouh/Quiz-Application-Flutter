import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData,{super.key});

  final Map<String,Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer=itemData['user_answer']==itemData['correct_answer'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer
        ),
        const SizedBox(width: 20.0,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
                const SizedBox(height: 5.0,),
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                ),
          ],
        ))
      ],
    );
  }
}
