import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/quiz_question_page.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({super.key});

  static const primaryRed = Color(0xFFB71C1C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Quiz Review 1', style: TextStyle(fontSize: 14)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _quizDescription(),
          const SizedBox(height: 16),
          _quizInfoCard(),
          const SizedBox(height: 20),
          _attemptSection(),
          const SizedBox(height: 20),
          _finalScore(),
          const SizedBox(height: 20),
          _actionButtons(context),
        ],
      ),
    );
  }

  // ================= DESKRIPSI =================
  Widget _quizDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: const Text(
        'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai '
        'pertama komponen kuis.\n\n'
        'Jangan lupa klik tombol Submit Answer setelah menjawab seluruh '
        'pertanyaan.\n\n'
        'Kerjakan sebelum hari Jumat, 26 Februari 2021 jam 23:59 WIB.',
        style: TextStyle(fontSize: 13, height: 1.5),
      ),
    );
  }

  // ================= INFO KUIS =================
  Widget _quizInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Kuis Akan di tutup pada Jumat, 26 Februari 2021, 11:59 PM',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 12),
          _InfoRow(label: 'Batas Waktu', value: '15 menit'),
          _InfoRow(label: 'Metode Penilaian', value: 'Nilai Tertinggi'),
        ],
      ),
    );
  }

  // ================= PERCOBAAN =================
  Widget _attemptSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Percobaan Yang Sudah Di Lakukan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        /// HEADER ROW
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status', style: TextStyle(color: Colors.white)),
              Text('Nilai / 100.00', style: TextStyle(color: Colors.white)),
              Text('Tinjau kembali', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),

        /// CONTENT
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selesai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Text('85,0', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 16),
              TextButton(onPressed: () {}, child: const Text('Lihat')),
            ],
          ),
        ),
      ],
    );
  }

  // ================= NILAI AKHIR =================
  Widget _finalScore() {
    return const Center(
      child: Text(
        'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ================= BUTTONS =================
  Widget _actionButtons(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const QuizQuestionPage()),
            );
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Ambil Kuis'),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Kembali Ke Kelas'),
        ),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}

/// ================= INFO ROW =================
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
