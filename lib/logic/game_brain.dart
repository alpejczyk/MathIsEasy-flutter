import 'dart:math';

class Game {
  int _a;
  int _b;
  int rightAnswer;
  int wrongAnswer;
  String mathOperator;
  final _random = new Random();

  Map answers = Map();

  String generateEquation() {
    _a = Random().nextInt(100);
    _b = Random().nextInt(100);
    return '$_a + $_b';
  }

  void generateRightAnswer(List<int> randomKeyList) {
    //generateEquation();
    rightAnswer = _a + _b;
    answers[randomKeyNumber(randomKeyList)] = rightAnswer;
  }

  int generateWrongAnswer() => next(rightAnswer - 5, rightAnswer + 5);

  int randomKeyNumber(List<int> randomKeyList) {
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

  void clearAnswers() => answers.clear();

  void generateWrongAnswers(List<int> randomKeyList) {
    while (answers.length < 4) {
      wrongAnswer = generateWrongAnswer();
      print(wrongAnswer);
      if (wrongAnswer != rightAnswer) {
        if (!answers.containsValue(wrongAnswer)) {
          answers[randomKeyNumber(randomKeyList)] = wrongAnswer;
        }
      }
    }
  }

  Map getAnswers() {
    return answers;
  }

  void generateAnswers() {
    List<int> randomKeyList = [1, 2, 3, 4];
    generateRightAnswer(randomKeyList);
    generateWrongAnswers(randomKeyList);
    print(answers.toString());
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}
