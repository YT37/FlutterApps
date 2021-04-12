class Question {
  String ques;
  bool ans;
  Question(this.ques, this.ans);
}

class QuizBrain {

  int _quesNo = 0;

  List<Question> _quesAns = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
  ];

  void nextQues(){
    if(_quesNo < _quesAns.length - 1){
      _quesNo++;
    }
  }

  String quesTextGetter(){
    return _quesAns[_quesNo].ques;
  }

  bool ansTextGetter(){
    return _quesAns[_quesNo].ans;
  }

  bool isFin(){
    if(_quesNo == _quesAns.length - 1){
      return true;
    }
    return false;
  }

  void reset(){
    _quesNo = 0;
  }
}