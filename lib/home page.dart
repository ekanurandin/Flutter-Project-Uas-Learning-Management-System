import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'class_page.dart';
import 'announcement_page.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 85,
                color: const Color(0xFFB74848),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TEXT KIRI
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Hallo,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'EKA NUR ANDINI',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.red.shade700,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'MAHASISWA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),

                            Image.asset(
                              'assets/images/Group 5.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  //TUGAS
                  _sectionTitle('Tugas Yang Akan Datang'),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red.shade800,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'DESAIN ANTARMUKA &\nPENGALAMAN PENGGUNA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tugas 01 - UID Android Mobile Game',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Waktu Pengumpulan',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Jumat 26 Februari, 23:59 WIB',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // PENGUMUMAN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: const Text(
                            'Pengumuman Terakhir',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AnnouncementPage()),
                            );
                          },
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/gambar notice.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // PROGRES KELAS
                  _sectionTitle('Progres Kelas'),

                  _progressItem(
                    image: 'assets/images/desain uiux.png',
                    title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    progress: 0.89,
                  ),
                  _progressItem(
                    image: 'assets/images/pendidikan pancasila.jpg',
                    title: 'KEWARGANEGARAAN',
                    progress: 0.86,
                  ),
                  _progressItem(
                    image: 'assets/images/sistem operasi.jpg',
                    title: 'SISTEM OPERASI',
                    progress: 0.90,
                  ),
                  _progressItem(
                    image: 'assets/images/pemrograman perangkat bergerak multimedia.jpg',
                    title: 'PEMPROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
                    progress: 0.86,
                  ),
                   _progressItem(
                    image: 'assets/images/bahasa inggris bussines and scientific.jpg',
                    title: 'BAHASA INGGRIS BUSSINES AND SCIENTIFIC',
                    progress: 0.86,
                  ),
                  _progressItem(
                    image: 'assets/images/olahraga.jpg',
                    title: 'OLAHRAGA',
                    progress: 0.86,
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
          Positioned(
            top: 46,
            left: 258,
            child: Container(
              width: 106,
              height: 31,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.5),
              ),
            ),
          ),
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
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassPage()),
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
      );
  }

  

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _progressItem({
    required String image,
    required String title,
    required double progress,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade300,
                  color: Color(0xFFAF1116),
                ),
                const SizedBox(height: 4),
                Text('${(progress * 100).toInt()} % Selesai',
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
