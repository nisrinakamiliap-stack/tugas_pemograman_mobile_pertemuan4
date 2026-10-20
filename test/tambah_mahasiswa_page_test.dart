import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_pemprogaman_mobile_pertemuan4/data_mahasiswa.dart';
import 'package:tugas_pemprogaman_mobile_pertemuan4/daftar_mahasiswa_page.dart';

void main() {
  setUp(() {
    final dataAwal = List<Map<String, String>>.of(daftarMahasiswa);
    addTearDown(() {
      daftarMahasiswa
        ..clear()
        ..addAll(dataAwal);
    });
  });

  testWidgets('menolak NIM yang sudah terdaftar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DaftarMahasiswaPage()));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Nama Baru');
    await tester.enterText(find.byType(TextFormField).at(1), '21051001');
    await tester.enterText(find.byType(TextFormField).at(2), 'Jurusan Baru');
    await tester.enterText(find.byType(TextFormField).at(3), '2');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('NIM sudah terdaftar'), findsOneWidget);
    expect(find.text('Tambah Mahasiswa'), findsOneWidget);
  });

  testWidgets('menyimpan semester dan menampilkan snackbar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DaftarMahasiswaPage()));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Nama Baru');
    await tester.enterText(find.byType(TextFormField).at(1), '21051006');
    await tester.enterText(find.byType(TextFormField).at(2), 'Jurusan Baru');
    await tester.enterText(find.byType(TextFormField).at(3), '2');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('Data berhasil ditambahkan'), findsOneWidget);
    expect(
      daftarMahasiswa.any(
        (mahasiswa) =>
            mahasiswa['nim'] == '21051006' && mahasiswa['semester'] == '2',
      ),
      isTrue,
    );
  });
}
