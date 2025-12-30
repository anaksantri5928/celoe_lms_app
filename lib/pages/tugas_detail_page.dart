import 'package:flutter/material.dart';
import 'package:celoe_lms_app/widgets/upload_file_bottom_sheet.dart';

class TugasDetailPage extends StatelessWidget {
  const TugasDetailPage({super.key});

  static const primaryRed = Color(0xFFB71C1C);

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
          'Tugas 01 – UID Android Mobile Game',
          style: TextStyle(fontSize: 14),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _taskDescription(),
          const SizedBox(height: 16),
          _statusCard(),
          const SizedBox(height: 16),
          _submitButton(context),
        ],
      ),
    );
  }

  // ================= DESKRIPSI TUGAS =================
  Widget _taskDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: const Text(
        '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS '
        '(First Person Shooter) yang akan menjadi tugas pada mata kuliah '
        'Pemrograman Aplikasi Permainan.\n\n'
        '2. Desain yang dibuat harus melengkapi seluruh tampilan pada '
        'aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup '
        'kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung '
        'permainan seperti pop-up, alert, chat, dan lain-lain.\n\n'
        '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara '
        'manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen '
        'dalam desain.\n\n'
        '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, '
        'Genre, dan Platform. Sertakan penjelasan pada setiap elemen desain, '
        'seperti gambar, teks, tombol, icon, dan lain-lain.\n\n'
        '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.\n\n'
        '6. Tugas dikumpulkan paling lambat hari Jumat, 26 Februari 2021 jam '
        '23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada '
        'pertemuan selanjutnya via Zoom Meeting.',
        style: TextStyle(fontSize: 13, height: 1.5),
      ),
    );
  }

  // ================= STATUS CARD =================
  Widget _statusCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: const Text(
            'Status Tugas',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: Column(
            children: const [
              _StatusRow(
                label: 'Status',
                value: 'Sudah Mengirim untuk di nilai',
              ),
              _StatusRow(label: 'Status Nilai', value: 'Belum Di nilai'),
              _StatusRow(
                label: 'Batas tanggal',
                value: 'Jumat, 26 Februari 2021, 23:59 WIB',
              ),
              _StatusRow(
                label: 'Sisa Waktu',
                value: 'Tugas sudah di kirim 4 hari 6 jam sebelum nya',
              ),
              _FileRow(filename: 'Dandy Candra Pratama_770817014.pdf'),
            ],
          ),
        ),
      ],
    );
  }

  // ================= SUBMIT BUTTON =================
  Widget _submitButton(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (_) => const UploadFileBottomSheet(),
          );
        },

        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text('Tambahkan Tugas'),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}

/// ================= STATUS ROW =================
class _StatusRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatusRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}

/// ================= FILE ROW =================
class _FileRow extends StatelessWidget {
  final String filename;

  const _FileRow({required this.filename});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.insert_drive_file_outlined, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(filename, style: const TextStyle(fontSize: 12))),
      ],
    );
  }
}
