import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/home_page.dart';
import 'package:celoe_lms_app/pages/kelas_saya_page.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

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
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      /// BODY
      body: ListView(
        children: const [
          _NotificationItem(
            icon: Icons.description_outlined,
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          _NotificationItem(
            icon: Icons.quiz_outlined,
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          _NotificationItem(
            icon: Icons.description_outlined,
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          _NotificationItem(
            icon: Icons.quiz_outlined,
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          _NotificationItem(
            icon: Icons.description_outlined,
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
        ],
      ),

      /// BOTTOM NAV
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryRed,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: 2,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            }
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const KelasSayaPage()),
              );
            }
          },
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
      ),
    );
  }
}

/// ================= NOTIFICATION ITEM =================

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
