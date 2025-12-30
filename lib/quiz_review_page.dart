import 'package:flutter/material.dart';
import 'quiz_detail_review_page.dart';

class QuizReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final List<int?> selectedAnswers;

  const QuizReviewPage({
    super.key,
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        elevation: 0,
        title: const Text(
          'Review Jawaban',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// ===== INFO CARD =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _infoRow('Di Mulai Pada', 'Kamis 25 Februari 2021 10:25'),
                _infoRow('Status', 'Selesai'),
                _infoRow('Selesai Pada', 'Kamis 25 Februari 2021 10:40'),
                _infoRow('Waktu Penyelesaian', '13 Menit 22 Detik'),
                _infoRow('Nilai', '0 / 100'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          
          ...List.generate(questions.length, (index) {
            final question = questions[index];
            final selected = selectedAnswers[index];
            final answerText = selected != null
                ? '${String.fromCharCode(65 + selected)}. ${question['options'][selected]}'
                : '-';

            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  
                  Text(
                    'Pertanyaan ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                 
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(question['question']),
                  ),

                  const SizedBox(height: 8),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jawaban Tersimpan\n$answerText',
                        style: const TextStyle(fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizDetailReviewPage(
                                question: question,
                                selectedAnswer: selected,
                                correctAnswer: question['correct'],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Lihat Soal',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 16),

         
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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
                'Kirim Jawaban',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  
  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}