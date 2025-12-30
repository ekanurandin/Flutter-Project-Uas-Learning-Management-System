import 'package:flutter/material.dart';
import 'home page.dart';
import 'class_page.dart';
import 'notification_page.dart';
import 'announcement_detail_page.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pengumuman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          announcementItem(
            context: context,
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            author: 'Admin Celco',
            date: 'Rabu, 2 Juni 2021, 10:45',
            content: 'Pengumuman Maintenance Pra UAS Semester Genap 2020/2021\n\nSistem Learning Management akan dilakukan maintenance pada tanggal 2 Juni 2021 mulai pukul 10:45 WIB. Selama maintenance, sistem tidak dapat diakses. Mohon maaf atas ketidaknyamanannya.',
          ),
          announcementItem(
            context: context,
            title: 'Pengumuman Maintenance',
            author: 'Admin Celco',
            date: 'Senin, 11 Januari 2021, 7:52',
            content: '',
          ),
          announcementItem(
            context: context,
            title: 'Maintenance Pra UAS Semester Ganjil 2020/2021',
            author: 'Admin Celco',
            date: 'Minggu, 10 Januari 2021, 9:30',
            content: '',
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
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else if (index == 1) {
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

  Widget announcementItem({
    required BuildContext context,
    required String title,
    required String author,
    required String date,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: () {
          if (title == 'Maintenance Pra UAS Semester Genap 2020/2021') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnnouncementDetailPage(
                  title: title,
                  author: author,
                  date: date,
                ),
              ),
            );
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.volume_up,
              size: 28,
              color: Colors.black,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'By $author - $date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
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