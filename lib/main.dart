import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'halaman/halaman_utama.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qjfuzxpzjclefmdlcxpd.supabase.co',
    anonKey: 'sb_publishable_ggxmj_i3E7F0qYJWeCcrDA_UHEaAHeb',
  );

  runApp(const AplikasiPerpustakaan());
}

class AplikasiPerpustakaan extends StatelessWidget {
  const AplikasiPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manajemen Perpustakaan',
            theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      themeMode: ThemeMode.system,
      home: HalamanUtama(),
    );
  }
}