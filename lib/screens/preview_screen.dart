import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/draggable_text.dart';

class PreviewScreen extends StatefulWidget {
  final String name;
  final String role;
  final String number;
  final File image;

  const PreviewScreen({
    required this.name,
    required this.role,
    required this.number,
    required this.image,
  });

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  Offset namePos = Offset(100, 100);
  Offset rolePos = Offset(100, 150);
  Offset numberPos = Offset(100, 200);
  Offset photoPos = Offset(50, 300);
  double photoSize = 100;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Card Preview')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          DraggableText(
            text: widget.name,
            position: namePos,
            onDrag: (newPos) => setState(() => namePos = newPos),
          ),
          DraggableText(
            text: widget.role,
            position: rolePos,
            onDrag: (newPos) => setState(() => rolePos = newPos),
          ),
          DraggableText(
            text: widget.number,
            position: numberPos,
            onDrag: (newPos) => setState(() => numberPos = newPos),
          ),
          Positioned(
            left: photoPos.dx,
            top: photoPos.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  photoPos += details.delta;
                });
              },
              child: ClipOval(
                child: Image.file(
                  widget.image,
                  width: photoSize,
                  height: photoSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}