# CeLOE LMS App

Aplikasi Learning Management System (LMS) untuk mahasiswa Telkom University yang dikembangkan menggunakan Flutter.

## Deskripsi

CeLOE LMS App adalah aplikasi mobile yang dirancang untuk memudahkan mahasiswa dalam mengakses materi pembelajaran, mengikuti kelas, melihat pengumuman, dan mengelola tugas serta kuis. Aplikasi ini menyediakan antarmuka yang user-friendly dengan navigasi bottom navigation bar yang melengkung dan desain yang menarik.

## Fitur Utama

- **Halaman Beranda (Home)**: Menampilkan tugas yang akan datang, pengumuman terakhir, dan progres kelas.
- **Kelas Saya**: Daftar kelas yang diikuti mahasiswa dengan informasi progres dan sampul gambar unik untuk setiap mata kuliah.
- **Notifikasi**: Menampilkan notifikasi terkait tugas, kuis, dan pengumuman.
- **Navigasi Bottom**: Bottom navigation bar dengan sudut melengkung, warna merah primer, dan efek bayangan halus.
- **Detail Pengumuman**: Halaman detail pengumuman dengan banner gambar.
- **Dashboard Kelas**: Halaman dashboard untuk setiap kelas dengan materi dan tugas.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk pengembangan aplikasi mobile cross-platform.
- **Dart**: Bahasa pemrograman utama.
- **Material Design**: Komponen UI dari Google untuk desain yang konsisten.

## Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── pages/                    # Halaman-halaman utama
│   ├── home_page.dart        # Halaman beranda
│   ├── kelas_saya_page.dart  # Halaman daftar kelas
│   ├── notifikasi_page.dart  # Halaman notifikasi
│   ├── pengumuman_detail_page.dart # Detail pengumuman
│   └── ...                   # Halaman lainnya
├── widgets/                  # Komponen widget reusable
│   └── upload_file_bottom_sheet.dart
└── assets/                   # Gambar dan asset statis
    ├── header.jpg
    └── splash_screen.png
```

## Persyaratan Sistem

- Flutter SDK (versi terbaru)
- Dart SDK
- Android Studio atau VS Code dengan ekstensi Flutter
- Emulator atau perangkat Android/iOS untuk testing

## Cara Menjalankan Aplikasi

1. **Clone Repository**:
   ```
   git clone <repository-url>
   cd celoe_lms_app
   ```

2. **Install Dependencies**:
   ```
   flutter pub get
   ```

3. **Jalankan Aplikasi**:
   ```
   flutter run
   ```

4. **Build untuk Production**:
   ```
   flutter build apk  # Untuk Android
   flutter build ios  # Untuk iOS
   ```

## Konfigurasi

- **Warna Primer**: `#B74848` (Merah CeLOE)
- **Font**: Default Flutter font
- **Gambar Asset**: Pastikan semua gambar ditempatkan di folder `assets/` dan direferensikan dengan benar di kode.

## Kontribusi

Untuk berkontribusi pada proyek ini:

1. Fork repository
2. Buat branch fitur baru (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request