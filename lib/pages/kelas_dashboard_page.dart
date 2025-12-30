import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/materi_sheet_page.dart';

class KelasDashboardPage extends StatefulWidget {
  const KelasDashboardPage({super.key});

  @override
  State<KelasDashboardPage> createState() => _KelasDashboardPageState();
}

class _KelasDashboardPageState extends State<KelasDashboardPage> {
  static const primaryRed = Color(0xFFB71C1C);
  int _activeTab = 0; // 0 = Materi, 1 = Tugas & Kuis

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
        title: const Text(
          'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
          style: TextStyle(fontSize: 13),
        ),
      ),

      body: Column(
        children: [
          _tabMenu(),
          Expanded(child: _tabContent()),
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

  // ================= TAB MENU =================
  Widget _tabMenu() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TabButton(
            label: 'Materi',
            active: _activeTab == 0,
            onTap: () => setState(() => _activeTab = 0),
          ),
          _TabButton(
            label: 'Tugas Dan Kuis',
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
      return _materiTab();
    }
    return _tugasDanKuisTab();
  }

  // ================= MATERI TAB =================
  Widget _materiTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _MateriCard(
          pertemuan: 'Pertemuan 1',
          title: '01 - Pengantar User Interface Design',
          info: '3 URLs, 2 Files, 3 Interactive Content',
          done: false,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MateriSheetPage()),
            );
          },
        ),
        const _MateriCard(
          pertemuan: 'Pertemuan 2',
          title: '02 - Konsep User Interface Design',
          info: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
          done: true,
        ),
        const _MateriCard(
          pertemuan: 'Pertemuan 3',
          title: '03 - Interaksi pada User Interface Design',
          info: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
        const _MateriCard(
          pertemuan: 'Pertemuan 4',
          title: '04 - Ethnographic Observation',
          info: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
        const _MateriCard(
          pertemuan: 'Pertemuan 5',
          title: '05 - UID Testing',
          info: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
        const _MateriCard(
          pertemuan: 'Pertemuan 6',
          title: '06 - Assessment 1',
          info: '3 URLs, 2 Files, 3 Interactive Content',
          done: true,
        ),
      ],
    );
  }

  // ================= TUGAS & KUIS TAB =================
  Widget _tugasDanKuisTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _TugasKuisCard(
          badge: 'QUIZ',
          title: 'Quiz Review 01',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          done: true,
          isQuiz: true,
        ),
        _TugasKuisCard(
          badge: 'Tugas',
          title: 'Tugas 01 – UID Android Mobile Game',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          done: false,
          isQuiz: false,
        ),
        _TugasKuisCard(
          badge: 'Pertemuan 3',
          title: 'Kuis – Assessment 2',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          done: true,
          isQuiz: true,
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
          if (active) Container(width: 32, height: 2, color: Colors.black),
        ],
      ),
    );
  }
}

/// ================= MATERI CARD =================
class _MateriCard extends StatelessWidget {
  final String pertemuan;
  final String title;
  final String info;
  final bool done;
  final VoidCallback? onTap;

  const _MateriCard({
    required this.pertemuan,
    required this.title,
    required this.info,
    required this.done,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      pertemuan,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    info,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              done ? Icons.check_circle : Icons.check_circle_outline,
              color: done ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= TUGAS / KUIS CARD =================
class _TugasKuisCard extends StatelessWidget {
  final String badge;
  final String title;
  final String deadline;
  final bool done;
  final bool isQuiz;

  const _TugasKuisCard({
    required this.badge,
    required this.title,
    required this.deadline,
    required this.done,
    required this.isQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      isQuiz ? Icons.quiz_outlined : Icons.assignment_outlined,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  deadline,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            done ? Icons.check_circle : Icons.check_circle_outline,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
