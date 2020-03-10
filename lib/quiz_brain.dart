import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [];

  List<Question> _basicBank = [
    Question('コピー', 'C'),
    Question('ペースト', 'V'),
    Question('保存', 'S'),
  ];

  List<Question> _browseBank = [
    Question('リロード', 'R'),
    Question('新規タブ', 'T'),
    Question('一つ前のページに戻る', '←'),
  ];

  void setQuestions(String course) {
    switch (course) {
      case 'basic':
        _questionBank = _basicBank;
        break;
      case 'browse':
        _questionBank = _browseBank;
        break;
    }
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //A method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //A print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      return true;
    } else {
      return false;
    }
  }

  //A reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }

  int getQuestionLength() {
    return _questionBank.length;
  }
}
