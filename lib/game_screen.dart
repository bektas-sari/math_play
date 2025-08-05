// lib/game_screen.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/question.dart';
import 'widgets/draggable_number.dart';
import 'widgets/answer_drop_zone.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<MathQuestion> questions;
  int currentIndex = 0;
  int score = 0;
  bool isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    questions = List.generate(10, (_) => _generateQuestion());
  }

  MathQuestion _generateQuestion() {
    final random = Random();
    final op1 = random.nextInt(9) + 1;
    final op2 = random.nextInt(9) + 1;
    if (random.nextBool()) {
      return MathQuestion(
        operand1: op1,
        operand2: op2,
        operator: '+',
        answer: op1 + op2,
      );
    } else {
      final a = max(op1, op2);
      final b = min(op1, op2);
      return MathQuestion(
        operand1: a,
        operand2: b,
        operator: '-',
        answer: a - b,
      );
    }
  }

  void _checkAnswer(int selected) {
    setState(() {
      isAnswerCorrect = selected == questions[currentIndex].answer;
      if (isAnswerCorrect) score++;
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          isAnswerCorrect = false;
        });
      } else {
        _showResults();
      }
    });
  }

  void _showResults() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Congratulations!'),
        content: Text(
          'You answered $score out of ${questions.length} questions correctly.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                questions = List.generate(10, (_) => _generateQuestion());
                currentIndex = 0;
                score = 0;
                isAnswerCorrect = false;
              });
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    final answers = <int>{
      q.answer,
      q.answer + Random().nextInt(3) + 1,
      (q.answer - (Random().nextInt(3) + 1)).abs() + 1,
      q.answer + Random().nextInt(5) + 2,
    }.toList()
      ..shuffle();

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF74ebd5), Color(0xFFACB6E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    '${q.operand1} ${q.operator} ${q.operand2} = ?',
                    key: ValueKey<int>(currentIndex),
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnswerDropZone(
                  onAccept: _checkAnswer,
                  isAnswerCorrect: isAnswerCorrect,
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    'Score: $score',
                    key: ValueKey<int>(score),
                    style: const TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                ),
                const Spacer(),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: answers.map((n) => DraggableNumber(number: n)).toList(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () => SystemNavigator.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Exit',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
