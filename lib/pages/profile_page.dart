import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const primaryRed = Color(0xFFB71C1C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: primaryRed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 16),
            _tabCard(),
            const SizedBox(height: 24),
            _infoUser(),
            const SizedBox(height: 24),
            _loginActivity(),
            const SizedBox(height: 32),
            _logoutButton(),
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
          const SizedBox(height: 12),

          /// PROFILE IMAGE (fallback icon)
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.red.shade700,
            child: const Icon(
              Icons.broken_image,
              color: Colors.white,
              size: 40,
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
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _TabItem(label: 'About Me', active: true),
            _TabItem(label: 'Kelas'),
            _TabItem(label: 'Edit Profile'),
          ],
        ),
      ),
    );
  }

  // ================= INFORMASI USER =================
  Widget _infoUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Informasi User',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          _InfoItem(
            title: 'Email address',
            value: 'dandycandra@365.telkomuniversity.ac.id',
          ),
          _InfoItem(
            title: 'Program Studi',
            value: 'D4 Teknologi Rekayasa Multimedia',
          ),
          _InfoItem(
            title: 'Fakultas',
            value: 'FIT',
          ),
        ],
      ),
    );
  }

  // ================= LOGIN ACTIVITY =================
  Widget _loginActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Aktivitas Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          _InfoItem(
            title: 'First access to site',
            value: 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
          ),
          _InfoItem(
            title: 'Last access to site',
            value: 'Tuesday, 22 June 2021, 9:44 PM (now)',
          ),
        ],
      ),
    );
  }

  // ================= LOGOUT =================
  Widget _logoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.logout, color: Colors.white),
          label: const Text(
            'Log Out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// ================= SMALL WIDGETS =================

class _TabItem extends StatelessWidget {
  final String label;
  final bool active;

  const _TabItem({
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            width: 24,
            height: 2,
            color: Colors.grey,
          ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
