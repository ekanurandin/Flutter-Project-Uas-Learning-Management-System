import 'package:flutter/material.dart';

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
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            author: 'Admin Celco',
            date: 'Rabu, 2 Juni 2021, 10:45',
          ),
          announcementItem(
            title: 'Pengumuman Maintenance',
            author: 'Admin Celco',
            date: 'Senin, 11 Januari 2021, 7:52',
          ),
          announcementItem(
            title: 'Maintenance Pra UAS Semester Ganjil 2020/2021',
            author: 'Admin Celco',
            date: 'Minggu, 10 Januari 2021, 9:30',
          ),
        ],
      ),
    );
  }

  Widget announcementItem({
    required String title,
    required String author,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }
}