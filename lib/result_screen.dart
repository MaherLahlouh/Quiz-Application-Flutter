import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions_data.dart';
import 'package:quizapp/question_summary.dart';
import 'package:quizapp/data/questions_data.dart';

class ResultScreen extends StatelessWidget {
   const ResultScreen({super.key,required this.chosenAnswers,required this.onRestart});

  final List<String>chosenAnswers;

  final void Function ()onRestart;
  List<Map<String,Object>>getSummary(){
    final  List<Map<String,Object>> summary=[];
    for(var i=0; i<chosenAnswers.length; i++){
      summary.add({
        'question_index':i,
        'question':questions[i].questionText,
        'correct_answer':questions[i].answers[0],
        'user_answers':chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummary();
    final totalNumberOfQuestions=questions.length;
    final totalNumberOfCorrectQuestions=summaryData.where((data){
      return data['user_answers']==data['correct_answer'];
    }).length;
    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answerd $totalNumberOfCorrectQuestions out of $totalNumberOfQuestions question correctly!',style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white,
            ),),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
           TextButton.icon(
               onPressed: onRestart,
               style: TextButton.styleFrom(
                 foregroundColor: Colors.white,
               ) ,
               label: const Text('Restart Quiz!'),
               icon: const Icon(Icons.refresh) ,
                ),


          ],
        ),
      ),
    );
  }
}
