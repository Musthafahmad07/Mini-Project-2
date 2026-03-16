import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/buku.dart';

class HalamanForm extends StatefulWidget {

  final Buku? buku;

  const HalamanForm({super.key, this.buku});

  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {

  final supabase = Supabase.instance.client;
  final _formKey = GlobalKey<FormState>();

  final controllerJudul = TextEditingController();
  final controllerPengarang = TextEditingController();
  final controllerTahun = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.buku != null) {
      controllerJudul.text = widget.buku!.judul;
      controllerPengarang.text = widget.buku!.pengarang;
      controllerTahun.text = widget.buku!.tahun;
    }
  }

  Future<void> simpanData() async {

    if (controllerJudul.text.isEmpty ||
        controllerPengarang.text.isEmpty ||
        controllerTahun.text.isEmpty) {

      Get.snackbar("Eits", "Semua Data harus diisi");
      return;
    }

    if (widget.buku == null) {

      await supabase.from('buku').insert({
        'judul': controllerJudul.text,
        'pengarang': controllerPengarang.text,
        'tahun': controllerTahun.text,
      });

    } else {

      await supabase
          .from('buku')
          .update({
            'judul': controllerJudul.text,
            'pengarang': controllerPengarang.text,
            'tahun': controllerTahun.text,
          })
          .eq('id', widget.buku!.id!);
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.buku == null
            ? "Tambah Buku"
            : "Edit Buku"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

        child: Column(
          children: [

            TextFormField(
              controller: controllerJudul,
              decoration: const InputDecoration(
                labelText: "Judul Buku",
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Judul buku wajib diisi";
                }
                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: controllerPengarang,
              decoration: const InputDecoration(
                labelText: "Nama Pengarang",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nama wajib  diisi";
                }
                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: controllerTahun,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tahun",
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tahun wajib diisi";
                }
                  if (int.tryParse(value) == null) {
                    return "Tahun harus berupa angka";
                  }
                return null;
              },
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  simpanData();
                }
              },
              child: Text(widget.buku == null
                  ? "Simpan"
                  : "Update"),
              ),
            ],
          ),
        ),
      )
    );
  }
}