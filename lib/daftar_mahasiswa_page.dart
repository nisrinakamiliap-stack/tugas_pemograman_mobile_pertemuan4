import 'package:flutter/material.dart';

import 'data_mahasiswa.dart';
import 'detail_mahasiswa_page.dart';
import 'tambah_mahasiswa_page.dart';

class DaftarMahasiswaPage extends StatefulWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  State<DaftarMahasiswaPage> createState() => _DaftarMahasiswaPageState();
}

class _DaftarMahasiswaPageState extends State<DaftarMahasiswaPage> {
  Future<void> _bukaFormTambah() async {
    final dataBaru = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const TambahMahasiswaPage()),
    );

    if (!mounted || dataBaru == null) {
      return;
    }

    setState(() {
      daftarMahasiswa.add(dataBaru);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil ditambahkan')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa')),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaFormTambah,
        child: const Icon(Icons.add),
      ),
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
