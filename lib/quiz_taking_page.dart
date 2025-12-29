import 'package:flutter/material.dart';

class QuizTakingPage extends StatefulWidget {
  const QuizTakingPage({super.key});

  @override
  State<QuizTakingPage> createState() => _QuizTakingPageState();
}

class _QuizTakingPageState extends State<QuizTakingPage> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = List.filled(5, null);

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': [
        'Jenis Kelamin',
        'Alamat',
        'Hobby',
        'Riwayat Pendidikan',
        'Umur'
      ],
      'correct': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quiz Review I',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 5),
                Text('15 : 00'),
              ],
            ),
          ],
        ),
      ),

      /// ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ======== NOMOR SOAL BULAT ========
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  bool isActive = index == currentQuestionIndex;
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: isActive ? const Color(0xFFB74A4A) : Colors.grey),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive ? const Color(0xFFB74A4A) : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// ======== SOAL NOMOR ========
            const Text(
              'Soal Nomor 1 / 15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            /// ======== PERTANYAAN ========
            Text(
              question['question'],
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// ======== OPSI JAWABAN ========
            ...List.generate(question['options'].length, (index) {
              bool isSelected = selectedAnswers[currentQuestionIndex] == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswers[currentQuestionIndex] = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEF6C6C)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text(
                        String.fromCharCode(65 + index) + '. ',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          question['options'][index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const Spacer(),

            /// ======== BUTTON NEXT ========
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: selectedAnswers[currentQuestionIndex] != null
                    ? () {}
                    : null,
                child: const Text('Soal Selanjutnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}