// lib/widgets/answer_drop_zone.dart

import 'package:flutter/material.dart';

class AnswerDropZone extends StatelessWidget {
  final ValueChanged<int> onAccept;
  final bool isAnswerCorrect;

  const AnswerDropZone({
    Key? key,
    required this.onAccept,
    required this.isAnswerCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: onAccept,
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isAnswerCorrect ? 140 : 120,
          height: isAnswerCorrect ? 140 : 120,
          decoration: BoxDecoration(
            color: isAnswerCorrect ? Colors.greenAccent : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: isAnswerCorrect
                    ? Colors.green.withOpacity(0.6)
                    : Colors.black.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(
            isAnswerCorrect ? Icons.check : Icons.help_outline,
            size: 40,
            color: isAnswerCorrect ? Colors.green : Colors.grey,
          ),
        );
      },
    );
  }
}
