import 'package:flutter/material.dart';

import 'data_mahasiswa.dart';
import 'detail_mahasiswa_page.dart';

class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa')),
      body: ListView.builder(
        itemCount: daftarMahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = daftarMahasiswa[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(mhs['nama']!),
              subtitle: Text('NIM: ${mhs['nim']}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMahasiswaPage(mahasiswa: mhs),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
