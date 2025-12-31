import 'package:flutter/material.dart';
import 'package:celoe_lms_app/widgets/help_bottom_sheet.dart';
import 'package:celoe_lms_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  static const primaryRed = Color(0xFFB74848);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// ================= HEADER IMAGE =================
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset('assets/header.jpg', fit: BoxFit.cover),
          ),

          /// ================= WHITE TOP WAVE =================
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(height: 120, color: Colors.white),
            ),
          ),

          /// ================= FLOATING LOGO =================
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 32,
                backgroundColor: primaryRed,
                child: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),

          /// ================= FORM CONTENT =================
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 32),

                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// EMAIL
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email 365',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryRed, width: 2),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PASSWORD
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryRed, width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      /// LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            showHelpBottomSheet(context);
                          },
                          child: const Text(
                            'Bantuan ?',
                            style: TextStyle(color: primaryRed),
                          ),
                        ),
                      ),

                      /// JARAK AMAN DARI RED WAVE
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// ================= BOTTOM RED WAVE =================
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(height: 140, color: primaryRed),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= TOP WAVE CLIPPER =================
class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// ================= BOTTOM WAVE CLIPPER =================
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height * 0.35);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.15,
      size.width * 0.5,
      size.height * 0.35,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width,
      size.height * 0.35,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
