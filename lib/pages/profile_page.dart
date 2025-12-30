import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const primaryRed = Color(0xFFB71C1C);

  int _activeTab = 2; // 0=About Me, 1=Kelas, 2=Edit Profile

  // Controllers (Edit Profile)
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController countryCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: _bottomNav(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 16),
            _tabCard(),
            const SizedBox(height: 16),
            _tabContent(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      color: primaryRed,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.red.shade700,
            child: const Icon(
              Icons.broken_image,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'DANDY CANDRA PRATAMA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // ================= TAB CARD =================
  Widget _tabCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TabItem(
              label: 'About Me',
              active: _activeTab == 0,
              onTap: () => setState(() => _activeTab = 0),
            ),
            _TabItem(
              label: 'Kelas',
              active: _activeTab == 1,
              onTap: () => setState(() => _activeTab = 1),
            ),
            _TabItem(
              label: 'Edit Profile',
              active: _activeTab == 2,
              onTap: () => setState(() => _activeTab = 2),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TAB CONTENT =================
  Widget _tabContent() {
    switch (_activeTab) {
      case 0:
        return _aboutMe();
      case 1:
        return _kelasList();
      case 2:
        return _editProfileForm();
      default:
        return const SizedBox();
    }
  }

  // ================= ABOUT ME =================
  Widget _aboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _InfoItem(
            title: 'Email address',
            value: 'dandycandra@365.telkomuniversity.ac.id',
          ),
          _InfoItem(
            title: 'Program Studi',
            value: 'D4 Teknologi Rekayasa Multimedia',
          ),
          _InfoItem(title: 'Fakultas', value: 'FIT'),
        ],
      ),
    );
  }

  // ================= KELAS =================
  Widget _kelasList() {
    return Column(
      children: [
        _kelasItem(
          'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
          'D4SM-41-GABI [ARS]',
        ),
        _kelasItem(
          'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
          'D4SM-42-03 [ADY]',
        ),
        _kelasItem('KEWARGANEGARAAN', 'D4SM-41-GABI [BBO]'),
        _kelasItem('OLAH RAGA', 'D3TT-44-02 [EYR]'),
        _kelasItem('PEMROGRAMAN MULTIMEDIA INTERAKTIF', 'D4SM-43-04 [TPR]'),
        _kelasItem(
          'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
          'D4SM-41-GABI [APJ]',
        ),
        _kelasItem('SISTEM OPERASI', 'D4SM-44-02 [DDS]'),
      ],
    );
  }

  Widget _kelasItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(18),
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
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Tanggal Mulai Monday, 8 February 2021',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= EDIT PROFILE =================
  Widget _editProfileForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputLabel('Nama Pertama'),
          _textField(firstNameCtrl),

          _inputLabel('Nama Terakhir'),
          _textField(lastNameCtrl),

          _inputLabel('E-mail Address'),
          _textField(emailCtrl),

          _inputLabel('Negara'),
          _textField(countryCtrl),

          _inputLabel('Deskripsi'),
          _textField(descCtrl, maxLines: 4),

          const SizedBox(height: 24),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: null, // disabled (sesuai screenshot)
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text('Simpan', style: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= BOTTOM NAV =================
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: primaryRed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Kelas Saya'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
        ),
      ],
    );
  }

  // ================= HELPERS =================
  Widget _inputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _textField(TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

/// ================= SMALL WIDGETS =================

class _TabItem extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _TabItem({
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
          if (active) Container(width: 24, height: 2, color: Colors.grey),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
