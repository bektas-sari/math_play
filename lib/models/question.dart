// lib/models/question.dart

class MathQuestion {
  final int operand1;
  final int operand2;
  final String operator;
  final int answer;

  MathQuestion({
    required this.operand1,
    required this.operand2,
    required this.operator,
    required this.answer,
  });
}
