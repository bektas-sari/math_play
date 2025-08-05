import 'package:flutter/material.dart';

class DraggableNumber extends StatelessWidget {
  final int number;

  const DraggableNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: number,
      feedback: Material(
        color: Colors.transparent,
        child: _buildNumberBubble(isDragging: true),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildNumberBubble(),
      ),
      child: _buildNumberBubble(),
      feedbackOffset: const Offset(0, 0),  // Burada parmağın hemen altına sabitleyeceğiz
    );
  }

  Widget _buildNumberBubble({bool isDragging = false}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDragging
              ? [Colors.orangeAccent, Colors.deepOrange]
              : [Colors.white, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
