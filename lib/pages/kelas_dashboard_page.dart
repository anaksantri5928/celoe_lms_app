import 'package:flutter/material.dart';

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
      return ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _MateriCard(
            pertemuan: 'Pertemuan 1',
            title: '01 - Pengantar User Interface Design',
            info: '3 URLs, 2 Files, 3 Interactive Content',
            done: false,
          ),
          _MateriCard(
            pertemuan: 'Pertemuan 2',
            title: '02 - Konsep User Interface Design',
            info: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
            done: true,
          ),
          _MateriCard(
            pertemuan: 'Pertemuan 3',
            title: '03 - Interaksi pada User Interface Design',
            info: '3 URLs, 2 Files, 3 Interactive Content',
            done: true,
          ),
          _MateriCard(
            pertemuan: 'Pertemuan 4',
            title: '04 - Ethnographic Observation',
            info: '3 URLs, 2 Files, 3 Interactive Content',
            done: true,
          ),
          _MateriCard(
            pertemuan: 'Pertemuan 5',
            title: '05 - UID Testing',
            info: '3 URLs, 2 Files, 3 Interactive Content',
            done: true,
          ),
          _MateriCard(
            pertemuan: 'Pertemuan 6',
            title: '06 - Assessment 1',
            info: '3 URLs, 2 Files, 3 Interactive Content',
            done: true,
          ),
        ],
      );
    }

    // Placeholder tab Tugas & Kuis
    return const Center(
      child: Text(
        'Tugas dan Kuis (Coming Soon)',
        style: TextStyle(color: Colors.grey),
      ),
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

  const _MateriCard({
    required this.pertemuan,
    required this.title,
    required this.info,
    required this.done,
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
          /// LEFT
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

          /// RIGHT ICON
          Icon(
            done ? Icons.check_circle : Icons.check_circle_outline,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
