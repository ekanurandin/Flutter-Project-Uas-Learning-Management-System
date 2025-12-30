import 'package:flutter/material.dart';

class QuizDetailReviewPage extends StatelessWidget {
  final Map<String, dynamic> question;
  final int? selectedAnswer;
  final int correctAnswer;

  const QuizDetailReviewPage({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        elevation: 0,
        title: const Text(
          'Detail Review',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['question'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(question['options'].length, (index) {
              bool isSelected = selectedAnswer == index;
              bool isCorrect = correctAnswer == index;
              Color bgColor = Colors.grey.shade100;
              Color textColor = Colors.black;
              if (isSelected && isCorrect) {
                bgColor = Colors.green;
                textColor = Colors.white;
              } else if (isSelected && !isCorrect) {
                bgColor = Colors.red;
                textColor = Colors.white;
              } else if (isCorrect) {
                bgColor = Colors.green.shade200;
                textColor = Colors.black;
              }
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}. ',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        question['options'][index],
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}