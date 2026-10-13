import 'package:flutter/material.dart';

class DetailMahasiswaPage extends StatelessWidget {
  final Map<String, String> mahasiswa;

  const DetailMahasiswaPage({
    super.key,
    required this.mahasiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mahasiswa['nama']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'NIM: ${mahasiswa['nim']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Jurusan: ${mahasiswa['jurusan']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}