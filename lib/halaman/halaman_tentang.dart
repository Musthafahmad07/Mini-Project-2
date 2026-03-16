import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.library_books, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Manajemen Perpustakaan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "Aplikasi ini merupakan aplikasi Manajemen Perpustakaan sederhana yang dibuat "
              "menggunakan Flutter dengan bahasa pemrograman Dart. Aplikasi ini bertujuan untuk membantu "
              "pengguna dalam menambahkan dan menyimpan data buku, termasuk informasi seperti judul buku, nama pengarang, dan tahun terbit.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
