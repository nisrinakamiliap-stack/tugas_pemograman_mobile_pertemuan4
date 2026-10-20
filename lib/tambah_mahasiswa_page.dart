import 'package:flutter/material.dart';

import 'data_mahasiswa.dart';

class TambahMahasiswaPage extends StatefulWidget {
  const TambahMahasiswaPage({super.key});

  @override
  State<TambahMahasiswaPage> createState() => _TambahMahasiswaPageState();
}

class _TambahMahasiswaPageState extends State<TambahMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _semesterController = TextEditingController();

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final dataBaru = <String, String>{
        'nama': _namaController.text.trim(),
        'nim': _nimController.text.trim(),
        'jurusan': _jurusanController.text.trim(),
        'semester': _semesterController.text.trim(),
      };

      Navigator.pop(context, dataBaru);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _jurusanController.dispose();
    _semesterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(labelText: 'NIM'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final nim = value?.trim() ?? '';
                  if (nim.isEmpty) {
                    return 'NIM wajib diisi';
                  }
                  if (int.tryParse(nim) == null) {
                    return 'NIM harus berupa angka';
                  }
                  if (daftarMahasiswa.any(
                    (mahasiswa) => mahasiswa['nim'] == nim,
                  )) {
                    return 'NIM sudah terdaftar';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _jurusanController,
                decoration: const InputDecoration(labelText: 'Jurusan'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jurusan wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _semesterController,
                decoration: const InputDecoration(labelText: 'Semester'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final semester = value?.trim() ?? '';
                  if (semester.isEmpty) {
                    return 'Semester wajib diisi';
                  }
                  if (int.tryParse(semester) == null) {
                    return 'Semester harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _simpan, child: const Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}
