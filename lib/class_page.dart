import 'package:flutter/material.dart';
import 'home page.dart';
import 'class_dashboard_page.dart';
import 'notification_page.dart';

class ClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFFB74A4A),
        leading: IconButton(
          icon: Image.asset('assets/images/back icon.png', width: 24, height: 24),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          'Kelas Saya',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _classItem(
              image: 'assets/images/desain uiux.png',
              title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
              progress: 0.89,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassDetailPage()),
                );
              },
            ),
            _classItem(
              image: 'assets/images/pendidikan pancasila.jpg',
              title: 'KEWARGANEGARAAN',
              progress: 0.86,
            ),
            _classItem(
              image: 'assets/images/sistem operasi.jpg',
              title: 'SISTEM OPERASI',
              progress: 0.90,
            ),
            _classItem(
              image: 'assets/images/pemrograman perangkat bergerak multimedia.jpg',
              title: 'PEMPROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
              progress: 0.86,
            ),
            _classItem(
              image: 'assets/images/bahasa inggris bussines and scientific.jpg',
              title: 'BAHASA INGGRIS BUSSINES AND SCIENTIFIC',
              progress: 0.86,
            ),
            _classItem(
              image: 'assets/images/olahraga.jpg',
              title: 'OLAHRAGA',
              progress: 0.86,
            ),
            SizedBox(height: 80),
          ],
        ),
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
    );
  }


  Widget _classItem({
    required String image,
    required String title,
    required double progress,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade300,
                        color: Color(0xFFAF1116),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${(progress * 100).toInt()} % Selesai',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}