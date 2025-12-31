import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/profile_page.dart';
import 'package:celoe_lms_app/pages/kelas_saya_page.dart';
import 'package:celoe_lms_app/pages/notifikasi_page.dart';
import 'package:celoe_lms_app/pages/pengumuman_page.dart';
import 'package:celoe_lms_app/pages/kelas_dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const primaryRed = Color(0xFFB74848);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// BOTTOM NAVIGATION
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
          currentIndex: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const KelasSayaPage()),
              );
            }
            if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NotifikasiPage()),
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),

            const SizedBox(height: 16),

            /// TUGAS
            _sectionTitle('Tugas Yang Akan Datang'),
            _taskCard(),

            const SizedBox(height: 24),

            /// PENGUMUMAN
            _announcementHeader(context),
            _announcementCard(),

            const SizedBox(height: 24),

            /// PROGRES
            _sectionTitle('Progres Kelas'),
            _progressList(context),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        color: primaryRed,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hallo,', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 4),
                Text(
                  'DANDY CANDRA PRATAMA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.shade800,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Text(
                    'MAHASISWA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 14, color: primaryRed),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SECTION TITLE =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ================= TASK CARD =================
  Widget _taskCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: primaryRed,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Tugas 01 - UID Android Mobile Game',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text('Waktu Pengumpulan', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 4),
            Text(
              'Jumat 26 Februari, 23:59 WIB',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= PENGUMUMAN =================
  Widget _announcementHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pengumuman Terakhir',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PengumumanPage()),
              );
            },
            child: Text(
              'Lihat Semua',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _announcementCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/gambar_pengumuman.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // ================= PROGRESS LIST =================
  Widget _progressList(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const KelasDashboardPage()),
            );
          },
          child: _progressItem('DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', 0.89),
        ),
        _progressItem('KEWARGANEGARAAN', 0.86),
        _progressItem('SISTEM OPERASI', 0.90),
        _progressItem('PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 0.90),
        _progressItem('BAHASA INGGRIS: BUSINESS & SCIENTIFIC', 0.90),
        _progressItem('PEMROGRAMAN MULTIMEDIA INTERAKTIF', 0.90),
        _progressItem('OLAH RAGA', 0.90),
      ],
    );
  }

  Widget _progressItem(String title, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/header.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: progress,
                  color: primaryRed,
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toInt()} % Selesai',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
