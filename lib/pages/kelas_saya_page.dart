import 'package:flutter/material.dart';

class KelasSayaPage extends StatelessWidget {
  const KelasSayaPage({super.key});

  static const primaryRed = Color(0xFFB74848);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Kelas Saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      /// BODY
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          _kelasItem(
            title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
            subtitle: 'D4SM-42-03 [ADY]',
            progress: 0.89,
          ),
          _kelasItem(
            title: 'KEWARGANEGARAAN',
            subtitle: 'D4SM-41-GABI [BBO]. JUMAT 2',
            progress: 0.86,
          ),
          _kelasItem(
            title: 'SISTEM OPERASI',
            subtitle: 'D4SM-44-02 [DDS]',
            progress: 0.90,
          ),
          _kelasItem(
            title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
            subtitle: 'D4SM-41-GABI [APJ]',
            progress: 0.90,
          ),
          _kelasItem(
            title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
            subtitle: 'D4SM-41-GABI [ARS]',
            progress: 0.90,
          ),
          _kelasItem(
            title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
            subtitle: 'D4SM-43-04 [TPR]',
            progress: 0.90,
          ),
          _kelasItem(
            title: 'OLAH RAGA',
            subtitle: 'D3TT-44-02 [EYR]',
            progress: 0.90,
          ),
        ],
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: primaryRed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
    );
  }

  // ================= KELAS ITEM =================
  Widget _kelasItem({
    required String title,
    required String subtitle,
    required double progress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE / FALLBACK
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),

          const SizedBox(width: 12),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '2021/2',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),

                /// PROGRESS BAR
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    color: primaryRed,
                  ),
                ),

                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toInt()} % Selesai',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
