import 'package:flutter/material.dart';
import '/model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  late TextEditingController _rmCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tglLahirCtrl;
  late TextEditingController _telpCtrl;
  late TextEditingController _alamatCtrl;

  @override
  void initState() {
    super.initState();
    _rmCtrl = TextEditingController(text: widget.pasien.nomorRm);
    _namaCtrl = TextEditingController(text: widget.pasien.nama);
    _tglLahirCtrl = TextEditingController(text: widget.pasien.tanggalLahir);
    _telpCtrl = TextEditingController(text: widget.pasien.nomorTelepon);
    _alamatCtrl = TextEditingController(text: widget.pasien.alamat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
                Pasien updated = Pasien(
                  id: widget.pasien.id,
                  nomorRm: _rmCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tglLahirCtrl.text,
                  nomorTelepon: _telpCtrl.text,
                  alamat: _alamatCtrl.text,
                );
                Navigator.pop(context, updated);
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
