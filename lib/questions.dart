import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/answer_buttons.dart';
import 'package:quizapp/data/questions_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onAnswerSelected});

  final void Function(String answer) onAnswerSelected;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex=0;
  void questionAnswer(String selectedAnswer){
    widget.onAnswerSelected(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[0];


    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.questionText,style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),

            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(buttonText: answer,onButtonPressed: (){
                questionAnswer(answer);
              },);

            }),
          ],
        ),
      ),
    );
  }
}
