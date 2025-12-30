import 'package:flutter/material.dart';

class PengumumanDetailPage extends StatelessWidget {
  const PengumumanDetailPage({super.key});

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
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            const Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            /// META
            Row(
              children: const [
                Icon(Icons.person_outline, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(
                  'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// IMAGE / BANNER
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 24),

            /// CONTENT TITLE
            const Text(
              'Maintenance LMS',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            /// CONTENT
            const Text(
              'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan '
              'melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan '
              'layanan server dalam menghadapi ujian akhir semester (UAS).\n\n'
              'Dengan adanya kegiatan maintenance tersebut maka situs LMS '
              '(lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.\n\n'
              'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.\n\n'
              'Hormat Kami,\n'
              'CeLOE Telkom University',
              style: TextStyle(fontSize: 13, height: 1.6),
            ),
          ],
        ),
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
