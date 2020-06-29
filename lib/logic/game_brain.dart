import 'dart:math';

class Game {
  int _a;
  int _b;
  int _rightAnswer;
  int _rightAnswerKey;
  int _wrongAnswer;
  int _score = 0;
  String mathOperator;
  final _random = new Random();

  Map _answers = Map();

  String generateEquation() {
    _a = Random().nextInt(20);
    _b = Random().nextInt(20);
    return '$_a + $_b';
  }

  void _generateRightAnswer(List<int> randomKeyList) {
    //generateEquation();
    _rightAnswer = _a + _b;
    _rightAnswerKey = _randomKeyNumber(randomKeyList);
    _answers[_rightAnswerKey] = _rightAnswer;
  }

  int _generateWrongAnswer() => next(_rightAnswer - 5, _rightAnswer + 5);

  int _randomKeyNumber(List<int> randomKeyList) {
    print(randomKeyList.length);
    int randomKey = 20;
    while (randomKey == 20) {
      var key = next(1, 5);
      if (randomKeyList.contains(key)) {
        randomKey = key;
      }
    }
    randomKeyList.remove(randomKey);

    return randomKey;
  }

  void clearAnswers() => _answers.clear();

  void checkForRightAnswer(int key) {
    if (key == _rightAnswerKey) {
      _score++;
    }
  }

  int getScore() => _score;

  void _generateWrongAnswers(List<int> randomKeyList) {
    while (_answers.length < 4) {
      _wrongAnswer = _generateWrongAnswer();
      print(_wrongAnswer);
      if (_wrongAnswer != _rightAnswer) {
        if (!_answers.containsValue(_wrongAnswer)) {
          _answers[_randomKeyNumber(randomKeyList)] = _wrongAnswer;
        }
      }
    }
  }

  Map getAnswers() {
    return _answers;
  }

  void scoreReset() => _score = 0;

  void generateAnswers() {
    List<int> randomKeyList = [1, 2, 3, 4];
    _generateRightAnswer(randomKeyList);
    _generateWrongAnswers(randomKeyList);
    print(_answers.toString());
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}
