import 'package:flutter/material.dart';
import 'quiz_taking_page.dart';
import 'quiz_review_page.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({super.key});

  List<Map<String, dynamic>> get questions => [
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
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB74A4A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Quiz Review 01'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// DESKRIPSI
            const Text(
              'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai '
              'pertama komponen kuis.\n\n'
              'Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\n\n'
              'Kerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),

            const SizedBox(height: 16),

            /// INFO BOX
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Text(
                    'Kuis Akan di tutup pada Jumat, 26 Februari 2021, 11:59 PM',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Batas Waktu: 15 menit',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Metode Penilaian: Nilai Tertinggi',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// JUDUL SECTION
            const Text(
              'Percobaan Yang Sudah Di Lakukan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            /// HEADER TABEL
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: const [
                  Expanded(child: Text('Status', style: TextStyle(color: Colors.white))),
                  Expanded(child: Text('Nilai / 100.00', style: TextStyle(color: Colors.white))),
                  Expanded(child: Text('Tinjau kembali', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),

            /// ROW DATA
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Text('85,0', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizReviewPage(
                              questions: questions,
                              selectedAnswers: [0, 1, 0],
                            ),
                          ),
                        );
                      },
                      child: const Text('Lihat'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// NILAI AKHIR
            const Text(
              'Nilai Akhir Anda Untuk Kuis Ini Adalah 85,0 / 100.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            /// BUTTONS
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizTakingPage()),
                      );
                    },
                    child: const Text('Ambil Kuis'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(200, 40),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kembali Ke Kelas'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}