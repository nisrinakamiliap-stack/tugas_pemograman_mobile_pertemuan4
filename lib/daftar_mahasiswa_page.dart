import 'package:flutter/material.dart';

import 'data_mahasiswa.dart';
import 'detail_mahasiswa_page.dart';

Color _colorForJurusan(String jurusan) {
  switch (jurusan) {
    case 'Teknik Informatika':
      return const Color(0xFF1565C0); // Biru tua
    case 'Sistem Informasi':
      return const Color(0xFF2E7D32); // Hijau tua
    case 'Teknik Komputer':
      return const Color(0xFF6A1B9A); // Ungu tua
    default:
      return const Color(0xFF37474F); // Abu-abu gelap
  }
}

class DaftarMahasiswaPage extends StatefulWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  State<DaftarMahasiswaPage> createState() => _DaftarMahasiswaPageState();
}

class _DaftarMahasiswaPageState extends State<DaftarMahasiswaPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = daftarMahasiswa
        .where((mhs) =>
            mhs['nama']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari nama mahasiswa...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: filteredList.isEmpty
                ? const Center(
                    child: Text(
                      'Mahasiswa tidak ditemukan.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final mhs = filteredList[index];
                      final color = _colorForJurusan(mhs['jurusan']!);
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text(mhs['nama']!),
                          subtitle: Text('NIM: ${mhs['nim']}'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailMahasiswaPage(mahasiswa: mhs),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
