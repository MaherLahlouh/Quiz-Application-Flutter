import 'package:flutter/material.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'data/questions_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

   List<String> selectedAnswers=[];
  var activeScreen='start-screen';


  void switchScreens() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen= 'questions-screen';
    });
  }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen='result-screen';
        });
    }  
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget=StartScreen(switchScreens);
    if (activeScreen == 'questions-screen') {
      screenWidget=QuestionsScreen(onAnswerSelected:chooseAnswers);

    }
    if (activeScreen == 'result-screen') {
      screenWidget= ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //activeScreen=='start-screen'?StartScreen(switchScreens): QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
