class QuizQuestions{
  //Constructor
  QuizQuestions(this.questionText,this.answers);
  // String to save the questions
  final String questionText;
  // List to save the answers
  final List<String>answers;

  List<String> getShuffledAnswers(){
   final suhffledList= List.of(answers);
   suhffledList.shuffle();
   return suhffledList;

  }
}