import 'package:flutter/material.dart';

class MateriKonsepUIDPage extends StatefulWidget {
  const MateriKonsepUIDPage({super.key});

  @override
  State<MateriKonsepUIDPage> createState() => _MateriKonsepUIDPageState();
}

class _MateriKonsepUIDPageState extends State<MateriKonsepUIDPage> {
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
          title: 'Elemen-elemen Antarmuka Pengguna',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.description_outlined,
          title: 'UID Guidelines and Principles',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.description_outlined,
          title: 'User Profile',
          done: true,
        ),
        _LampiranItem(
          icon: Icons.link,
          title: 'Principles of User Interface Design URL',
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
          if (active) Container(width: 36, height: 2, color: Colors.black),
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
          Expanded(child: Text(title, style: const TextStyle(fontSize: 13))),
          Icon(
            done ? Icons.check_circle : Icons.check_circle_outline,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
