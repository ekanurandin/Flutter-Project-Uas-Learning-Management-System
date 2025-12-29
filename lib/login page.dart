import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Image.asset(
                    'assets/images/telkom.jpg',
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                // Placeholder for logo space
                SizedBox(height: 80),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none,
                        ),
                      ),

                      const SizedBox(height: 17),

                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration: Duration(milliseconds: 200),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFAF1116),
                          ),
                          child: const Text(
                            "Log In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => _HelpBottomSheet(),
                            );
                          },
                          child: const Text(
                            'Bantuan ?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32), 
                    ],
                  ),
                ),

                
                ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                    height: 130,
                    color: const Color(0xFFB74848),
                  ),
                ),
              ],
            ),
            // LOGO positioned absolutely
            Positioned(
              top: 180,
              left: 148,
              child: Stack(
                children: [
                  // White ellipse background
                  ClipOval(
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color(0xFFB74848),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Logo
                  Positioned(
                    top: 11.5,
                    left: 18,
                    child: ClipOval(
                      child: Container(
                        width: 39,
                        height: 52,
                        child: Image.asset(
                          'assets/images/LogoTelkom.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Login text
            Positioned(
              top: 312,
              left: 21,
              child: Container(
                width: 67,
                height: 36,
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: false),
                ),
              ),
            ),
            
            Positioned(
              top: 430,
              left: 21,
              child: Container(
                width: 332.5,
                height: 2,
                color: Color(0xFFB74848),
              ),
            ),
            
            Positioned(
              top: 495,
              left: 21,
              child: Container(
                width: 332.5,
                height: 2,
                color: Color(0xFFB74848),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // kiri
    path.lineTo(0, size.height - 10);

    // kanan
    path.lineTo(size.width, size.height - 80);

    // kanan atas
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 40);

    path.quadraticBezierTo(
      size.width * 0.25,
      0,
      size.width * 0.5,
      40,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      80,
      size.width,
      40,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _HelpBottomSheet extends StatefulWidget {
  @override
  State<_HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<_HelpBottomSheet> {
  String language = 'id';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),

          
          Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 16),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _languageItem(
                code: 'id',
                flag: 'assets/images/indonesia.png',
              ),
              const SizedBox(width: 40),
              _languageItem(
                code: 'en',
                flag: 'assets/images/inggris.png',
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: language == 'id' ? _helpID() : _helpEN(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _helpID() {
    return const Text(
      '''Akses hanya untuk Dosen dan Mahasiswa Telkom University.

Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut:

Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"
Password (Akun iGracias) pada kolom Password.

Kegagalan yang terjadi pada Autentikasi disebabkan oleh:
• Password belum diubah menjadi "Strong Password"

Pastikan Anda telah melakukan perubahan Password di iGracias.

Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk:

Mail : infoceloe@telkomuniversity.ac.id
WhatsApp : +62 821-1666-3563
''',
      style: TextStyle(fontSize: 15, height: 1.6),
    );
  }

  Widget _helpEN() {
    return const Text(
      '''Access is limited to Lecturers and Students of Telkom University.

Login using your Microsoft Office 365 account by following these instructions:

Username (iGracias Account) add "@365.telkomuniversity.ac.id"
Password (iGracias Account) in the Password field.

Authentication failure may occur because:
• Password has not been changed to a "Strong Password"

Please ensure you have updated your password in iGracias.

For further information, contact CeLOE Helpdesk:

Email : infoceloe@telkomuniversity.ac.id
WhatsApp : +62 821-1666-3563
''',
      style: TextStyle(fontSize: 15, height: 1.6),
    );
  }

  Widget _languageItem({
    required String code,
    required String flag,
  }) {
    final bool isActive = language == code;

    return GestureDetector(
      onTap: () => setState(() => language = code),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(flag, width: 26),
          const SizedBox(height: 6),
          Text(
            code.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),

          
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isActive ? 14 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0x80000000),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}