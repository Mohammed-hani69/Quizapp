import 'package:flutter/material.dart';
import 'package:flutter_project/QuizApp.dart';
import 'package:flutter_project/ResultScreen.dart';

import 'Questionmodel.dart';

class StartQuiz extends StatefulWidget {
  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _questionWidget(),
            answerList(),
          ],
        ),
      ),
    );
  }

  Widget _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: 'Question ${currentQuestionIndex + 1} '),
                TextSpan(
                  text: '/ ${questionList.length}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget answerList() {
    return Column(
      children: questionList[currentQuestionIndex].answersList.map((answer) {
        return _answerButton(answer);
      }).toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return GestureDetector(
      onTap: () {
        if (selectedAnswer == null) {
          setState(() {
            selectedAnswer = answer;
          });
          Future.delayed(Duration(seconds: 1), () {
            _nextQuestion();
          });
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          child: Text(answer.answerText),
          style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            primary: isSelected ? Colors.teal : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: _nextQuestion,
        ),
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionList.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
      } else {
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    int score = 0;
    for (var question in questionList) {
      if (question.selectedAnswer?.isCorrect == true) {
        score++;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(score: score),
      ),
    );
  }
}