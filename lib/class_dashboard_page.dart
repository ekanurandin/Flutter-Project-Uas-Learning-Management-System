import 'package:flutter/material.dart';
import 'home page.dart';
import 'notification_page.dart';

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
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: const Text(
              'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
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
            _tugasDanKuisTab(),
          ],
        ),
        bottomNavigationBar: Container(
          width: 375,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(255, 209, 87, 87),
              selectedItemColor: const Color.fromARGB(255, 255, 252, 252),
              unselectedItemColor: Colors.grey,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: 1,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Kelas Saya',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifikasi',
                ),
              ],
            ),
          ),
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

  Widget _tugasDanKuisTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _tugasKuisCardCustom(
          badge: 'QUIZ',
          badgeColor: Colors.blue,
          title: 'Quiz Review 01',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isDone: true,
          icon: Icons.quiz,
        ),
        _tugasKuisCardCustom(
          badge: 'Tugas',
          badgeColor: Colors.blue,
          title: 'Tugas 01 - UID Android Mobile Game',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isDone: false,
          icon: Icons.assignment,
        ),
        _tugasKuisCardCustom(
          badge: 'Pertemuan 3',
          badgeColor: Colors.blue,
          title: 'Kuis - Assessment 2',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isDone: true,
          icon: Icons.quiz,
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
              Icons.check_circle,
              color: selesai ? Colors.green : Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tugasKuisCardCustom({
    required String badge,
    required Color badgeColor,
    required String title,
    required String deadline,
    required bool isDone,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON KIRI
            Icon(icon, size: 36, color: Colors.black87),
            const SizedBox(width: 12),

            // KONTEN
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BADGE (RECTANGLE TANPA RADIUS)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // JUDUL
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // DEADLINE
                  Text(
                    deadline,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // ICON STATUS KANAN
            Icon(
              Icons.check_circle,
              color: isDone ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}