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

      /// ===== HEADER =====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          color: const Color(0xFFB74A4A),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title & Timer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Quiz Review |',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_alarm, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        '15 : 00',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Soal Number
            const Text(
              'Soal Nomor 1 / 15',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// Number Indicator
            Column(
              children: [
                SizedBox(
                  height: 24,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (_, __) => const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 24,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Text(
                          '${index + 11}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Question Text
            Text(
              question['question'],
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// Options
            ...List.generate(question['options'].length, (index) {
              bool isSelected = selectedAnswer == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFF16B6B)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        question['options'][index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const Spacer(),

            /// Back Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.grey.shade100,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali Ke Halaman Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}