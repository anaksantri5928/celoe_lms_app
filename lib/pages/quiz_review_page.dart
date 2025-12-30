import 'package:flutter/material.dart';

class QuizReviewPage extends StatelessWidget {
  const QuizReviewPage({super.key});

  static const primaryRed = Color(0xFFB71C1C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
        title: const Text('Review Jawaban', style: TextStyle(fontSize: 14)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCard(),
            const SizedBox(height: 24),
            _questionItem(
              number: 1,
              question: 'Radio button dapat digunakan untuk menentukan ?',
              answer: 'A. Jenis Kelamin',
            ),
            _questionItem(
              number: 2,
              question:
                  'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              answer: 'B. Konsistensi',
            ),
            _questionItem(
              number: 3,
              question:
                  'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              answer: 'C. Konsistensi',
            ),
            _questionItem(
              number: 4,
              question: 'Radio button dapat digunakan untuk menentukan ?',
              answer: 'A. Jenis Kelamin',
            ),
            _questionItem(
              number: 5,
              question:
                  'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              answer: 'C. Konsistensi',
            ),
            _questionItem(
              number: 6,
              question:
                  'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
              answer: 'C. Konsistensi',
            ),
            _questionItem(
              number: 7,
              question: 'Radio button dapat digunakan untuk menentukan ?',
              answer: 'A. Jenis Kelamin',
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: submit jawaban
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Kirim Jawaban',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ================= INFO CARD =================
  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          _InfoRow(
            left: 'Di Mulai Pada',
            right: 'Kamis 25 Februari 2021 10:25',
          ),
          _InfoRow(left: 'Status', right: 'Selesai'),
          _InfoRow(left: 'Selesai Pada', right: 'Kamis 25 Februari 2021 10:40'),
          _InfoRow(left: 'Waktu Penyelesaian', right: '13 Menit 22 Detik'),
          _InfoRow(left: 'Nilai', right: '0 / 100'),
        ],
      ),
    );
  }

  // ================= QUESTION ITEM =================
  Widget _questionItem({
    required int number,
    required String question,
    required String answer,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pertanyaan $number',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.grey.shade300,
            child: Text(question, style: const TextStyle(fontSize: 12)),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jawaban Tersimpan\n$answer',
                style: const TextStyle(fontSize: 12),
              ),
              TextButton(
                onPressed: () {
                  // TODO: lihat soal
                },
                child: const Text('Lihat Soal', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ================= INFO ROW =================
class _InfoRow extends StatelessWidget {
  final String left;
  final String right;

  const _InfoRow({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(fontSize: 12)),
          Text(
            right,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
