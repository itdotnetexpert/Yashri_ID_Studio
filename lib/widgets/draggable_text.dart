import 'package:flutter/material.dart';

class DraggableText extends StatelessWidget {
  final String text;
  final Offset position;
  final void Function(Offset) onDrag;

  const DraggableText({
    required this.text,
    required this.position,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) => onDrag(position + details.delta),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}