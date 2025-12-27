import 'package:flutter/material.dart';
import 'home page.dart';
import 'class_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 0;

  String userName = 'EKA NUR ANDINI';
  String userEmail = 'akucantik@gmail.com.uim.ac.id';
  String userProgram = 'S1 Teknik Informatika';
  String userFakultas = 'Teknik';

  TextEditingController firstNameController = TextEditingController(text: 'EKA');
  TextEditingController lastNameController = TextEditingController(text: 'NUR ANDINI');
  TextEditingController emailController = TextEditingController(text: 'akucantik@gmail.com.uim.ac.id');
  TextEditingController programController = TextEditingController(text: 'S1 Teknik Informatika');
  TextEditingController fakultasController = TextEditingController(text: 'Teknik');

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    programController.dispose();
    fakultasController.dispose();
    super.dispose();
  }

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
                  userName,
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
                          _tabItem('About Me', 0),
                          _tabItem('Kelas', 1),
                          _tabItem('Edit Profile', 2),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                _getTabContent(),
              ],
            ),
          ),

          SizedBox(height: 80),
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

  
  Widget _tabItem(String title, int index) {
    bool active = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
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
      ),
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

  Widget _inputBox({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: maxLines > 1 ? 12 : 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _aboutMeContent();
      case 1:
        return _kelasContent();
      case 2:
        return _editProfileContent();
      default:
        return Container();
    }
  }

  Widget _aboutMeContent() {
    return Column(
      children: [
        // INFORMASI USER
        _sectionTitle('Informasi User'),
        _infoItem('Email address', userEmail),
        _infoItem('Program Studi', userProgram),
        _infoItem('Fakultas', userFakultas),

        SizedBox(height: 20),

        // AKTIVITAS LOGIN
        _sectionTitle('Aktivitas Login'),
        _infoItem('First access to site', 'Monday, 7 September 2020, 9:27 AM'),
        _infoItem('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM'),

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
      ],
    );
  }

  Widget _kelasContent() {
    return Column(
      children: [
        _kelasListItem(
          title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
          subtitle: 'D4SM-41-GABI [ARS]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
          subtitle: 'D4SM-42-03 [ADY]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'KEWARGANEGARAAN',
          subtitle: 'D4SM-41-GABI [BBO], JUMAT 2',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'OLAH RAGA D3TT-44-02',
          subtitle: '[EYR]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
          subtitle: 'D4SM-43-04 [TPR]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
          subtitle: 'D4SM-41-GABI [APJ]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        _kelasListItem(
          title: 'SISTEM OPERASI',
          subtitle: 'D4SM-44-02 [DDS]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _editProfileContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputBox(
            controller: firstNameController,
            label: 'Nama Pertama',
          ),
          SizedBox(height: 12),

          _inputBox(
            controller: lastNameController,
            label: 'Nama Terakhir',
          ),
          SizedBox(height: 12),

          _inputBox(
            controller: emailController,
            label: 'E-mail Address',
          ),
          SizedBox(height: 12),

          _inputBox(
            controller: programController,
            label: 'Negara',
          ),
          SizedBox(height: 12),

          _inputBox(
            controller: fakultasController,
            label: 'Deskripsi',
            maxLines: 4,
          ),

          SizedBox(height: 24),

          // TOMBOL SIMPAN
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    userName = '${firstNameController.text} ${lastNameController.text}';
                    userEmail = emailController.text;
                    userProgram = programController.text;
                    userFakultas = fakultasController.text;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Perubahan telah disimpan')),
                  );
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _kelasListItem({
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PIL BIRU KIRI
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF8EC1E8),
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          SizedBox(width: 16),

          // TEXT KANAN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 4),
                Text(
                  date,
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