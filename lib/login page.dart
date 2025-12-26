import 'package:flutter/material.dart';

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
                // === GAMBAR TERPOTONG ===
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Image.asset(
                    'assets/images/uim.jpg',
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
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
                                  appBar: AppBar(title: Text('Halaman Home')),
                                  body: Center(child: Text('Welcome to Home Page')),
                                ),
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
                              builder: (context) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Bantuan / HELP IDN',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Positioned(
                                      top: 4,
                                      left: 133,
                                      child: GestureDetector(
                                        onVerticalDragUpdate: (details) {
                                          if (details.delta.dy > 0) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Container(
                                          width: 109,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 21,
                                      left: 123,
                                      child: Image.asset(
                                        'assets/images/indonesia.png',
                                        width: 35,
                                        height: 22,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 21,
                                      left: 215,
                                      child: Image.asset(
                                        'assets/images/inggris.png',
                                        width: 37,
                                        height: 22,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                );
                              },
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

                      const SizedBox(height: 32), // JARAK AMAN
                    ],
                  ),
                ),
              ],
            ),
            // LOGO positioned absolutely
            Positioned(
              top: 207,
              left: 150,
              child: Stack(
                children: [
                  // White ellipse background
                  ClipOval(
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    left: 11,
                    child: ClipOval(
                      child: Container(
                        width: 52,
                        height: 52,
                        child: Image.asset(
                          'assets/images/logo uim.png',
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Line below email
            Positioned(
              top: 430,
              left: 21,
              child: Container(
                width: 332.5,
                height: 2,
                color: Color(0xFFB74848),
              ),
            ),
            // Line below password
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
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}