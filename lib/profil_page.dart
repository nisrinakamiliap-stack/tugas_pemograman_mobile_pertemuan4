import 'package:flutter/material.dart';
import 'daftar_mahasiswa_page.dart'; 
 
class HalamanProfil extends StatelessWidget {
  final String nama;
  final String nim;
 
  const HalamanProfil({super.key, required this.nama, required this.nim});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          // tombol kembali ke LoginPage
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profil.jpg'),
            ),
            const SizedBox(height: 16),
            Text(nama, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('NIM: $nim', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),   ElevatedButton(     onPressed: () {       Navigator.push(         context,         MaterialPageRoute(builder: (context) => const DaftarMahasiswaPage()),       );     }, 
            child: const Text('Lihat Daftar Mahasiswa'), ), 
          ],
        ),
      ),
    );
  }
}
