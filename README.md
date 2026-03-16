# 📚 Aplikasi Manajemen Perpustakaan
## Deskripsi Aplikasi
Aplikasi ini merupakan aplikasi Manajemen Perpustakaan sederhana yang dibuat menggunakan Flutter dengan bahasa pemrograman Dart. Aplikasi ini bertujuan untuk membantu pengguna dalam menambahkan dan menyimpan data buku, termasuk informasi seperti judul buku, nama pengarang, dan tahun terbit.

## ✨ Fitur Aplikasi

#### 1. Menampilkan Data Buku (Read)

- Aplikasi menampilkan daftar buku yang diambil dari database Supabase.

- Data ditampilkan dalam bentuk list yang berisi judul buku, pengarang, dan tahun.

#### 2. Menambahkan Data Buku (Create)

- Pengguna dapat menambahkan buku baru melalui halaman form.

- Data yang dimasukkan meliputi:

   - Judul Buku

   - Nama Pengarang

   - Tahun Terbit

#### 3. Mengubah Data Buku (Update)

- Pengguna dapat mengedit data buku yang sudah ada.

- Form akan otomatis menampilkan data sebelumnya untuk diperbarui.

#### 4. Menghapus Data Buku (Delete)

- Pengguna dapat menghapus data buku dari database.

- Sebelum menghapus, aplikasi akan menampilkan dialog konfirmasi.

#### 5. Validasi Form Input

- Melakukan validasi agar semua field harus diisi.

- Field tahun hanya boleh berupa angka.

#### 6. Dark Mode & Light Mode

- Pengguna dapat mengganti tema aplikasi antara mode terang dan mode gelap.

#### 7. Notifikasi Aksi

- Aplikasi menggunakan snackbar untuk menampilkan notifikasi ketika data berhasil dihapus atau terjadi kesalahan input.

## 🧩 Widget yang Digunakan

Berikut beberapa widget Flutter yang digunakan dalam aplikasi ini:

#### Widget Layout

Scaffold → Struktur dasar halaman aplikasi

AppBar → Menampilkan judul halaman

Column → Mengatur widget secara vertikal

Padding → Memberi jarak pada widget

SizedBox → Memberi jarak antar widget

#### Widget Input

TextFormField → Input data buku

Form → Mengelompokkan input form

ElevatedButton → Tombol untuk menyimpan atau update data

Widget List & Tampilan Data

ListView.builder → Menampilkan daftar buku

Card → Tampilan data buku dalam bentuk kartu

ListTile → Layout item pada list buku

CircleAvatar → Icon buku pada list

#### Widget Navigasi & Interaksi

FloatingActionButton → Tombol untuk menambah data buku

IconButton → Tombol edit, delete, dan perubahan tema

Dialog → Konfirmasi penghapusan data

#### Widget Utility

SnackBar (melalui GetX) → Menampilkan notifikasi

GetMaterialApp → Navigasi dan state management menggunakan GetX

## 🛠 Teknologi yang Digunakan

- Flutter

- Supabase

- GetX

- Dart
