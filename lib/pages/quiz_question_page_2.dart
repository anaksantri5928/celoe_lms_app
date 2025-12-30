import 'package:flutter/material.dart';

class QuizQuestionPage2 extends StatefulWidget {
  const QuizQuestionPage2({super.key});

  @override
  State<QuizQuestionPage2> createState() => _QuizQuestionPage2State();
}

class _QuizQuestionPage2State extends State<QuizQuestionPage2> {
  static const primaryRed = Color(0xFFB71C1C);

  int? selectedOption = 2; // C. Konsistensi

  final List<String> options = [
    'Integrasi',
    'Standarisasi',
    'Konsistensi',
    'Koefensi',
    'Koreksi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 4),
                Text(
                  '15 : 00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _questionNavigation(),
            const SizedBox(height: 20),
            const Text(
              'Soal Nomor 2 / 15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text(
              'Dalam perancangan web yang baik, untuk teks yang '
              'menyampaikan isi konten digunakan font yang sama di '
              'setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),
            ..._buildOptions(),
            const Spacer(),
            _navigationButtons(context),
          ],
        ),
      ),
    );
  }

  // ================= NAVIGASI NOMOR =================
  Widget _questionNavigation() {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _numberCircle(1, Colors.green), // sudah selesai
          _numberCircle(2, primaryRed),   // aktif
          for (int i = 3; i <= 15; i++)
            _numberCircle(i, Colors.white),
        ],
      ),
    );
  }

  Widget _numberCircle(int number, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(
          fontSize: 12,
          color: color == Colors.white ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ================= PILIHAN =================
  List<Widget> _buildOptions() {
    return List.generate(options.length, (index) {
      final isSelected = selectedOption == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red.shade400 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                '${String.fromCharCode(65 + index)}.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ================= BUTTON =================
  Widget _navigationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('Soal Sebelumnya'),
        ),
        OutlinedButton(
          onPressed: () {
            // lanjut ke halaman soal 3 (nanti)
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('Soal Selanjutnya'),
        ),
      ],
    );
  }
}
