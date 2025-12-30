import 'package:flutter/material.dart';

class QuizReviewDetailPage extends StatelessWidget {
  const QuizReviewDetailPage({super.key});

  static const primaryRed = Color(0xFFB74848);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
        title: const Text('Quiz Review 1', style: TextStyle(fontSize: 14)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.alarm, size: 18),
                SizedBox(width: 4),
                Text('15 : 00', style: TextStyle(fontWeight: FontWeight.bold)),
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
              'Soal Nomor 1 / 15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            const Text(
              'Radio button dapat digunakan untuk menentukan ?',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 24),

            _answerOption(label: 'A', text: 'Jenis Kelamin', selected: true),
            _answerOption(label: 'B', text: 'Alamat'),
            _answerOption(label: 'C', text: 'Hobby'),
            _answerOption(label: 'D', text: 'Riwayat Pendidikan'),
            _answerOption(label: 'E', text: 'Umur'),

            const Spacer(),

            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Kembali Ke Halaman Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= NAVIGASI NOMOR =================
  Widget _questionNavigation() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          return Container(
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= JAWABAN =================
  Widget _answerOption({
    required String label,
    required String text,
    bool selected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: selected ? Colors.red.shade400 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            '$label.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: selected ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
