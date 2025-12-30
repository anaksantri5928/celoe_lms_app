import 'package:flutter/material.dart';

class MateriSheetPage extends StatefulWidget {
  const MateriSheetPage({super.key});

  @override
  State<MateriSheetPage> createState() => _MateriSheetPageState();
}

class _MateriSheetPageState extends State<MateriSheetPage> {
  int _activeTab = 0; // 0 = Lampiran Materi, 1 = Tugas dan Kuis

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
          'Pengantar User Interface Design',
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
          Text(
            'Deskripsi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip '
            'desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun '
            'bukan hanya menarik secara visual tetapi dengan memperhatikan '
            'kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna '
            'dalam menggunakan produk secara baik. Pelajaran mengenai prinsip '
            'UID ini sudah pernah diajarkan dalam mata kuliah Implementasi '
            'Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview '
            'kembali sehingga dapat menjadi bekal saat memasuki materi '
            'mengenai User Experience',
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
      return _lampiranMateriTab();
    }
    return const Center(
      child: Text(
        'Tugas dan Kuis (Coming Soon)',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  // ================= LAMPIRAN MATERI =================
  Widget _lampiranMateriTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _LampiranItem(
          icon: Icons.link,
          title: 'Zoom Meeting Synchronous',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.description_outlined,
          title: 'Pengantar User Interface Design',
          done: false,
        ),
        _LampiranItem(
          icon: Icons.description_outlined,
          title: 'Empat Teori Dasar Antarmuka Pengguna',
          done: false,
        ),
        _LampiranItem(
          icon: Icons.description_outlined,
          title: 'Empat Teori Dasar Antarmuka Pengguna',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.smartphone,
          title: 'User Interface Design for Beginner',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.link,
          title: '20 Prinsip Desain',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.link,
          title: 'Best Practice UI Design',
          done: true,
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
          if (active)
            Container(
              width: 36,
              height: 2,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}

/// ================= LAMPIRAN ITEM =================
class _LampiranItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool done;

  const _LampiranItem({
    required this.icon,
    required this.title,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 13),
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
