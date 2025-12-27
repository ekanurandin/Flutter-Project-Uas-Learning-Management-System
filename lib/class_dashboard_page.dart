import 'package:flutter/material.dart';

class ClassDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: const Color(0xFFB74A4A),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
            style: TextStyle(fontSize: 14),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _materiTab(),
            Center(child: Text('Tugas dan Kuis')),
          ],
        ),
      ),
    );
  }

  Widget _materiTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _materiCard(
          pertemuan: 'Pertemuan 1',
          judul: '01 - Pengantar User Interface Design',
          detail: '3 URLs, 2 Files, 3 Interactive Content',
          selesai: false,
        ),
        _materiCard(
          pertemuan: 'Pertemuan 2',
          judul: '02 - Konsep User Interface Design',
          detail: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
          selesai: true,
        ),
        _materiCard(
          pertemuan: 'Pertemuan 3',
          judul: '03 - Interaksi pada User Interface Design',
          detail: '3 URLs, 2 Files, 3 Interactive Content',
          selesai: true,
        ),
        _materiCard(
          pertemuan: 'Pertemuan 4',
          judul: '04 - Ethnographic Observation',
          detail: '3 URLs, 2 Files, 3 Interactive Content',
          selesai: true,
        ),
        _materiCard(
          pertemuan: 'Pertemuan 5',
          judul: '05 - UID Testing',
          detail: '3 URLs, 2 Files, 3 Interactive Content',
          selesai: true,
        ),
        _materiCard(
          pertemuan: 'Pertemuan 6',
          judul: '06 - Assessment 1',
          detail: '3 URLs, 2 Files, 3 Interactive Content',
          selesai: true,
        ),
      ],
    );
  }

  Widget _materiCard({
    required String pertemuan,
    required String judul,
    required String detail,
    required bool selesai,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    pertemuan,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        judul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        detail,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              selesai ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selesai ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}