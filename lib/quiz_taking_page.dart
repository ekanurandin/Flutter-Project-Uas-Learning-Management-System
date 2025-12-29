import 'package:flutter/material.dart';

class QuizTakingPage extends StatefulWidget {
  const QuizTakingPage({super.key});

  @override
  State<QuizTakingPage> createState() => _QuizTakingPageState();
}

class _QuizTakingPageState extends State<QuizTakingPage> {
  int currentQuestionIndex = 0;
  final List<int> realQuestionNumbers = [1, 2, 15];
  List<int?> selectedAnswers = List.filled(3, null);

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < realQuestionNumbers.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

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
    {
      'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu?',
      'options': [
        'Integrasi',
        'Standarisasi',
        'Konsistensi',
        'Koefensi',
        'Koreksi'
      ],
      'correct': 1,
    },
    {
      'question': 'Apa itu widget tree?',
      'options': [
        'Struktur hierarki widget',
        'Database widget',
        'File widget',
        'Network widget',
        'Storage widget'
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
            Wrap(
              spacing: 6,
              runSpacing: 8,
              children: List.generate(15, (index) {
                int number = index + 1;
                int activeNumber = realQuestionNumbers[currentQuestionIndex];

                bool isActive = number == activeNumber;
                bool isAnswered = realQuestionNumbers
                    .take(currentQuestionIndex)
                    .contains(number);
                bool allGreen = currentQuestionIndex == realQuestionNumbers.length - 1;

                Color bgColor = Colors.white;
                Color borderColor = Colors.grey;
                Color textColor = Colors.black;

                if ((isActive && !allGreen) || isAnswered || (allGreen && number != 15)) {
                  bgColor = Colors.green;
                  borderColor = Colors.green;
                  textColor = Colors.white;
                }

                return Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: borderColor),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$number',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            /// ======== SOAL NOMOR ========
            Text(
              'Soal Nomor ${realQuestionNumbers[currentQuestionIndex]} / 15',
              style: const TextStyle(fontWeight: FontWeight.bold),
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

            /// ======== BUTTONS ========
            if (currentQuestionIndex == 0)
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
                      ? nextQuestion
                      : null,
                  child: const Text('Soal Selanjut nya'),
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// SEBELUMNYA
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: previousQuestion,
                    child: const Text('Soal Sebelum nya'),
                  ),

                  /// SELANJUTNYA / SELESAI
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentQuestionIndex == questions.length - 1
                          ? Colors.green
                          : Colors.grey.shade200,
                      foregroundColor: currentQuestionIndex == questions.length - 1
                          ? Colors.white
                          : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: currentQuestionIndex == questions.length - 1
                        ? (selectedAnswers[currentQuestionIndex] != null ? () => Navigator.pop(context) : null)
                        : (selectedAnswers[currentQuestionIndex] != null ? nextQuestion : null),
                    child: Text(
                      currentQuestionIndex == questions.length - 1
                          ? 'Selesai'
                          : 'Soal Selanjut nya',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}