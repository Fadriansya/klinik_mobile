import 'package:flutter/material.dart';
import '/model/pasien.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _rmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Nomor RM"),
              controller: _rmCtrl,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nama"),
              controller: _namaCtrl,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Tanggal Lahir"),
              controller: _tglLahirCtrl,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nomor Telepon"),
              controller: _telpCtrl,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Alamat"),
              controller: _alamatCtrl,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Pasien baru = Pasien(
                  id: 0,
                  nomorRm: _rmCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tglLahirCtrl.text,
                  nomorTelepon: _telpCtrl.text,
                  alamat: _alamatCtrl.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(pasien: baru),
                  ),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
