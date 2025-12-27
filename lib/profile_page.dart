import 'package:flutter/material.dart';
import 'home page.dart';
import 'class_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFFB74A4A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          
          Container(
            height: 220,
            width: double.infinity,
            color: Color(0xFFB74A4A),
          ),

          
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120),

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.red.shade700,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/mahasiswa.jpg'),
                  ),
                ),

                SizedBox(height: 12),

                
                Text(
                  'EKA NUR ANDINI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                // CARD TAB MENU
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _tabItem('About Me', true),
                          _tabItem('Kelas', false),
                          _tabItem('Edit Profile', false),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // INFORMASI USER
                _sectionTitle('Informasi User'),
                _infoItem('Email address',
                    'akucantik@gmail.com.uim.ac.id'),
                _infoItem(
                    'Program Studi', 'S1 Teknik Informatika'),
                _infoItem('Fakultas', 'Teknik'),

                SizedBox(height: 20),

                // AKTIVITAS LOGIN
                _sectionTitle('Aktivitas Login'),
                _infoItem('First access to site',
                    'Monday, 7 September 2020, 9:27 AM'),
                _infoItem('Last access to site',
                    'Tuesday, 22 June 2021, 9:44 PM'),

                SizedBox(height: 24),

                // BUTTON LOGOUT
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      icon: Icon(Icons.logout),
                      label: Text('Log Out'),
                      onPressed: () {},
                    ),
                  ),
                ),

                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),

      
      bottomNavigationBar: SizedBox(
        width: 375,
        height: 56,
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
    );
  }

  
  Widget _tabItem(String title, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(height: 4),
        if (active)
          Container(
            width: 30,
            height: 3,
            color: Colors.black,
          ),
      ],
    );
  }

  
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  
  Widget _infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 13, color: Colors.grey)),
            SizedBox(height: 2),
            Text(value, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}