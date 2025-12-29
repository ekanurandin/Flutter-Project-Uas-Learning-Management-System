import 'package:flutter/material.dart';

class QuizTakingPage extends StatefulWidget {
  const QuizTakingPage({super.key});

  @override
  State<QuizTakingPage> createState() => _QuizTakingPageState();
}

class _QuizTakingPageState extends State<QuizTakingPage> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = List.filled(15, null);

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
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
      'question': 'Apa itu Flutter?',
      'options': [
        'Bahasa pemrograman',
        'Framework UI',
        'Database',
        'Server',
        'OS'
      ],
      'correct': 1,
    },
    {
      'question': 'Apa fungsi dari StatefulWidget?',
      'options': [
        'Widget statis',
        'Widget yang bisa berubah',
        'Widget untuk teks',
        'Widget untuk gambar',
        'Widget untuk tombol'
      ],
      'correct': 1,
    },
    {
      'question': 'Bahasa pemrograman utama untuk Flutter adalah?',
      'options': [
        'Java',
        'Kotlin',
        'Dart',
        'Swift',
        'Python'
      ],
      'correct': 2,
    },
    {
      'question': 'Apa itu hot reload?',
      'options': [
        'Restart aplikasi',
        'Update kode tanpa restart',
        'Compile ulang',
        'Debug mode',
        'Release mode'
      ],
      'correct': 1,
    },
    {
      'question': 'Widget apa yang digunakan untuk layout vertikal?',
      'options': [
        'Row',
        'Column',
        'Stack',
        'Container',
        'ListView'
      ],
      'correct': 1,
    },
    {
      'question': 'Apa itu pubspec.yaml?',
      'options': [
        'File konfigurasi proyek',
        'File kode utama',
        'File untuk test',
        'File untuk assets',
        'File untuk dependencies'
      ],
      'correct': 0,
    },
    {
      'question': 'Bagaimana cara menambahkan padding pada widget?',
      'options': [
        'Menggunakan Padding widget',
        'Menggunakan Margin widget',
        'Menggunakan SizedBox',
        'Menggunakan Container',
        'Menggunakan Expanded'
      ],
      'correct': 0,
    },
    {
      'question': 'Apa itu BuildContext?',
      'options': [
        'Konteks build widget',
        'Konteks aplikasi',
        'Konteks database',
        'Konteks network',
        'Konteks file'
      ],
      'correct': 0,
    },
    {
      'question': 'Widget mana yang digunakan untuk navigasi?',
      'options': [
        'Navigator',
        'Route',
        'Scaffold',
        'AppBar',
        'BottomNavigationBar'
      ],
      'correct': 0,
    },
    {
      'question': 'Apa itu async/await?',
      'options': [
        'Untuk loop',
        'Untuk conditional',
        'Untuk asynchronous programming',
        'Untuk synchronous programming',
        'Untuk error handling'
      ],
      'correct': 2,
    },
    {
      'question': 'Bagaimana cara membuat list di Flutter?',
      'options': [
        'Menggunakan ListView',
        'Menggunakan Column',
        'Menggunakan Row',
        'Menggunakan Stack',
        'Menggunakan Container'
      ],
      'correct': 0,
    },
    {
      'question': 'Apa itu InheritedWidget?',
      'options': [
        'Widget untuk inheritance',
        'Widget untuk state management',
        'Widget untuk animation',
        'Widget untuk layout',
        'Widget untuk input'
      ],
      'correct': 1,
    },
    {
      'question': 'Bahasa apa yang digunakan untuk Android development?',
      'options': [
        'Java',
        'Kotlin',
        'Dart',
        'Swift',
        'Python'
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
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  bool isActive = index == currentQuestionIndex;
                  bool isAnswered = selectedAnswers[index] != null;

                  Color bgColor = Colors.white;
                  Color borderColor = Colors.grey;
                  Color textColor = Colors.black;

                  if (isActive) {
                    bgColor = Colors.white;
                    borderColor = Colors.grey;
                    textColor = Colors.black;
                  } else if (isAnswered) {
                    bgColor = Colors.green;
                    borderColor = Colors.green;
                    textColor = Colors.white;
                  }

                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: bgColor,
                      border: Border.all(color: borderColor),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// ======== SOAL NOMOR ========
            Text(
              'Soal Nomor ${currentQuestionIndex + 1} / 15',
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
                  /// SELANJUTNYA
                  ElevatedButton(
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
                ],
              ),
          ],
        ),
      ),
    );
  }
}