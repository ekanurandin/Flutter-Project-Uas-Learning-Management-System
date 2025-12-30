import 'package:flutter/material.dart';

class PPTPage extends StatefulWidget {
  const PPTPage({super.key});

  @override
  State<PPTPage> createState() => _PPTPageState();
}

class _PPTPageState extends State<PPTPage> {
  final List<String> slideImages = [
    'assets/images/slide 1.jpg',
    'assets/images/slide 2.jpg',
    'assets/images/slide 3.jpg',
    'assets/images/slide 4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        title: const Text('PPT: Pengantar User Interface Design'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: slideImages.map((slideImage) {
            return Image.asset(
              slideImage,
              fit: BoxFit.contain,
            );
          }).toList(),
        ),
      ),
    );
  }
}