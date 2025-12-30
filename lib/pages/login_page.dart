import 'package:flutter/material.dart';
import 'package:celoe_lms_app/widgets/help_bottom_sheet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// HEADER IMAGE
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.asset(
              'assets/header.png',
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 230),

                /// LOGIN CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),

                      /// LOGO
                      Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xFFB71C1C),
                          child: const Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// TITLE
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// EMAIL FIELD
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Email 365',
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB71C1C)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// PASSWORD FIELD
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const UnderlineInputBorder(),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB71C1C)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
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
                            backgroundColor: const Color(0xFFB71C1C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// HELP
                      Center(
                        child: TextButton(
                          onPressed: () {
                            showHelpBottomSheet(context);
                          },
                          child: const Text(
                            'Bantuan ?',
                            style: TextStyle(
                              color: Color(0xFFB71C1C),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM WAVE
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFB71C1C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
