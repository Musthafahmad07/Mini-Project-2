import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/buku.dart';
import 'halaman_form.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {

  final supabase = Supabase.instance.client;

  List<Buku> daftarBuku = [];

  Future<void> ambilData() async {

    final data = await supabase.from('buku').select();

    setState(() {
      daftarBuku =
          (data as List).map((e) => Buku.fromJson(e)).toList();
    });
  }

  Future<void> hapusData(int id) async {

    await supabase
        .from('buku')
        .delete()
        .eq('id', id);

    ambilData();

    Get.snackbar(
      "Berhasil",
      "Data berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("📚 Manajemen Perpustakaan"),
        centerTitle: true,
        elevation: 0,
          actions: [

          IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () {
              Get.changeThemeMode(ThemeMode.light);
            },
          ),

          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(ThemeMode.dark);
            },
          ),

        ],
      ),

      body: daftarBuku.isEmpty
          ? const Center(
              child: Text(
                "Belum ada data buku",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: daftarBuku.length,
              itemBuilder: (context, index) {

                final buku = daftarBuku[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: ListTile(

                    leading: const CircleAvatar(
                      child: Icon(Icons.book),
                    ),

                    title: Text(
                      buku.judul,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "${buku.pengarang} • ${buku.tahun}",
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.orange,
                          onPressed: () async {

                            await Get.to(
                              () => HalamanForm(buku: buku),
                            );

                            ambilData();
                          },
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {

                            Get.defaultDialog(
                              title: "Hapus Data",
                              middleText:
                                  "Apakah kamu yakin ingin menghapus buku ini?",
                              textConfirm: "Hapus",
                              textCancel: "Batal",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                hapusData(buku.id!);
                                Get.back();
                              },
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Tambah Buku"),
        onPressed: () async {

          await Get.to(() => const HalamanForm());

          ambilData();
        },
      ),
    );
  }
}