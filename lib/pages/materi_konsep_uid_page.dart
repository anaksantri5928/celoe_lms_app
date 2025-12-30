import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/tugas_detail_page.dart';
import 'package:celoe_lms_app/pages/quiz_detail_page.dart';

class MateriKonsepUIDPage extends StatefulWidget {
  const MateriKonsepUIDPage({super.key});

  @override
  State<MateriKonsepUIDPage> createState() => _MateriKonsepUIDPageState();
}

class _MateriKonsepUIDPageState extends State<MateriKonsepUIDPage> {
  int _activeTab = 1; // 0 = Lampiran Materi, 1 = Tugas dan Kuis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// APP BAR (SHEET STYLE)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Konsep User Interface Design',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [
          _descriptionSection(),
          _tabMenu(),
          Expanded(child: _tabContent()),
        ],
      ),
    );
  }

  // ================= DESKRIPSI =================
  Widget _descriptionSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Konsep dasar User Interface Design akan dipelajari bagaimana '
            'membangun sebuah Interaction Design pada antarmuka. '
            'Interaction ini sangat penting untuk aplikasi berkomunikasi '
            'dengan pengguna. Lalu dipelajari juga poin-poin penting pada '
            'interaction design seperti visibility, feedback, limitation, '
            'consistency dan affordance. Dan terakhir materi conceptual dan '
            'perceptual design interaction akan memberikan gambaran '
            'bagaimana bentuk dari Interaction.',
            style: TextStyle(fontSize: 13, height: 1.5),
          ),
        ],
      ),
    );
  }

  // ================= TAB MENU =================
  Widget _tabMenu() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TabButton(
            label: 'Lampiran Materi',
            active: _activeTab == 0,
            onTap: () => setState(() => _activeTab = 0),
          ),
          _TabButton(
            label: 'Tugas dan Kuis',
            active: _activeTab == 1,
            onTap: () => setState(() => _activeTab = 1),
          ),
        ],
      ),
    );
  }

  // ================= TAB CONTENT =================
  Widget _tabContent() {
    if (_activeTab == 0) {
      return const Center(
        child: Text(
          'Lampiran Materi (lihat tab sebelumnya)',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return _tugasDanKuisTab();
  }

  // ================= TUGAS & KUIS TAB =================
  Widget _tugasDanKuisTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizDetailPage()),
            );
          },
          child: _TugasKuisDetailCard(
            isQuiz: true,
            title: 'Kuis 01 – Konsep User Interface Design',
            description:
                'Kuis ini berisi pertanyaan-pertanyaan seputar konsep dasar '
                'User Interface Design yang telah dipelajari pada materi sebelumnya. '
                'Pastikan untuk menjawab semua pertanyaan dengan benar.',
            done: true,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TugasDetailPage()),
            );
          },
          child: _TugasKuisDetailCard(
            isQuiz: false,
            title: 'Tugas 01 – UID Android Mobile Game',
            description:
                '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile '
                'game FPS (First Person Shooter) yang akan menjadi tugas '
                'pada mata kuliah Pemrograman Aplikasi Permainan.\n'
                '2. Desain yang dibuat harus melengkapi seluruh tampilan '
                'pada aplikasi/game, dari pertama kali aplikasi dijalankan '
                'hingga proses utama permainan.',
            done: false,
          ),
        ),
      ],
    );
  }
}

/// ================= TAB BUTTON =================
class _TabButton extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (active) Container(width: 36, height: 2, color: Colors.black),
        ],
      ),
    );
  }
}

/// ================= TUGAS / KUIS DETAIL CARD =================
class _TugasKuisDetailCard extends StatelessWidget {
  final bool isQuiz;
  final String title;
  final String description;
  final bool done;

  const _TugasKuisDetailCard({
    required this.isQuiz,
    required this.title,
    required this.description,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          Container(
            width: 56,
            padding: const EdgeInsets.only(top: 16),
            alignment: Alignment.topCenter,
            child: Icon(
              isQuiz ? Icons.quiz_outlined : Icons.assignment_outlined,
              size: 26,
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + STATUS
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        done ? Icons.check_circle : Icons.check_circle_outline,
                        color: done ? Colors.green : Colors.grey,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// DESCRIPTION
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
