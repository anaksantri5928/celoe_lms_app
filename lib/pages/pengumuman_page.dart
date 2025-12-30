import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/pengumuman_detail_page.dart';

class PengumumanPage extends StatelessWidget {
  const PengumumanPage({super.key});

  static const primaryRed = Color(0xFFB71C1C);

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
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      /// BODY
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PengumumanDetailPage()),
              );
            },
            child: _PengumumanItem(
              title: 'Maintenance Pra UAS Semester Genap 2020/2021',
              meta: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
            ),
          ),
          _PengumumanItem(
            title: 'Pengumuman Maintenance',
            meta: 'By Admin Celoe - Senin, 11 Januari 2021, 7:52',
          ),
          _PengumumanItem(
            title: 'Maintenance Pra UAS Semester Ganjil 2020/2021',
            meta: 'By Admin Celoe - Minggu, 10 Januari 2021, 9:30',
          ),
        ],
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
}

/// ================= ITEM =================

class _PengumumanItem extends StatelessWidget {
  final String title;
  final String meta;

  const _PengumumanItem({required this.title, required this.meta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.campaign, size: 22, color: Colors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  meta,
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
