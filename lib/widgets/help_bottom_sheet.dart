import 'package:flutter/material.dart';

void showHelpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const HelpBottomSheet(),
  );
}

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// DRAG HANDLE
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          /// LANGUAGE SWITCH
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _languageTab(
                label: 'ID',
                emoji: '🇮🇩',
                active: !isEnglish,
                onTap: () => setState(() => isEnglish = false),
              ),
              const SizedBox(width: 24),
              _languageTab(
                label: 'EN',
                emoji: '🇬🇧',
                active: isEnglish,
                onTap: () => setState(() => isEnglish = true),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                isEnglish ? _englishText : _indonesiaText,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageTab({
    required String label,
    required String emoji,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: active ? Colors.red : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 24,
            color: active ? Colors.red : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

/// ================= TEXT CONTENT =================

const String _indonesiaText = '''
Akses hanya untuk Dosen dan Mahasiswa Telkom University.

Login menggunakan akun Microsoft Office 365 dengan menggunakan petunjuk berikut:

Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"
Password (Akun iGracias) pada kolom password.

Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi "Strong Password". Pastikan Anda telah melakukan perubahan Password iGracias.

Informasi lebih lanjut dapat menghubungi layanan CISOE Helpdesk di:

Mail   : infocisoe@telkomuniversity.ac.id
WhatsApp : +62 821-6668-3653
''';

const String _englishText = '''
Access restricted only for Lecturer and Student of Telkom University.

Login only using your Microsoft Office 365 Account by following these format:

Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"
Password (iGracias Account) on password field.

Failure upon Authentication could be possibly you have not yet changed your password into "Strong Password".
Make sure to change your password only in iGracias.

For further information, please contact CISOE Service Helpdesk:

Mail   : infocisoe@telkomuniversity.ac.id
WhatsApp : +62 821-6668-3653
''';
