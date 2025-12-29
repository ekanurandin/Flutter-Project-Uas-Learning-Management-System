import 'package:flutter/material.dart';

class QuizTakingPage extends StatefulWidget {
  const QuizTakingPage({super.key});

  @override
  State<QuizTakingPage> createState() => _QuizTakingPageState();
}

class _QuizTakingPageState extends State<QuizTakingPage> {
  int currentQuestionIndex = 0;
  List<String?> selectedAnswers = List.filled(5, null); // Assuming 5 questions

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa itu User Interface Design?',
      'options': ['Desain antarmuka pengguna', 'Desain database', 'Desain jaringan', 'Desain hardware'],
      'correct': 0,
    },
    {
      'question': 'Prinsip apa yang penting dalam UI Design?',
      'options': ['Konsistensi', 'Kompleksitas', 'Ketidakpastian', 'Ketergantungan'],
      'correct': 0,
    },
    {
      'question': 'Apa fungsi dari feedback dalam interaksi?',
      'options': ['Memberikan respons', 'Menyembunyikan informasi', 'Mengabaikan input', 'Menunda aksi'],
      'correct': 0,
    },
    {
      'question': 'Apa itu affordance?',
      'options': ['Petunjuk visual untuk penggunaan', 'Harga produk', 'Waktu loading', 'Ukuran layar'],
      'correct': 0,
    },
    {
      'question': 'Mengapa konsistensi penting dalam UI?',
      'options': ['Memudahkan pengguna belajar', 'Membuat aplikasi lambat', 'Menambah kompleksitas', 'Mengurangi fitur'],
      'correct': 0,
    },
  ];

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Submit quiz
      int score = 0;
      for (int i = 0; i < questions.length; i++) {
        if (selectedAnswers[i] != null && int.parse(selectedAnswers[i]!) == questions[i]['correct']) {
          score++;
        }
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Selesai'),
          content: Text('Skor Anda: $score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Back to detail page
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Quiz - Pertanyaan ${currentQuestionIndex + 1}/${questions.length}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              question['options'].length,
              (index) => RadioListTile<String>(
                title: Text(question['options'][index]),
                value: index.toString(),
                groupValue: selectedAnswers[currentQuestionIndex],
                onChanged: (value) {
                  setState(() {
                    selectedAnswers[currentQuestionIndex] = value;
                  });
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB74A4A),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 40),
                ),
                onPressed: selectedAnswers[currentQuestionIndex] != null ? nextQuestion : null,
                child: Text(currentQuestionIndex < questions.length - 1 ? 'Selanjutnya' : 'Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}