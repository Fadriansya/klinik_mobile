import 'package:flutter/material.dart';
import '/model/pegawai.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  late TextEditingController _nipCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tglLahirCtrl;
  late TextEditingController _telpCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _passCtrl;

  @override
  void initState() {
    super.initState();
    _nipCtrl = TextEditingController(text: widget.pegawai.nip);
    _namaCtrl = TextEditingController(text: widget.pegawai.nama);
    _tglLahirCtrl = TextEditingController(text: widget.pegawai.tanggalLahir);
    _telpCtrl = TextEditingController(text: widget.pegawai.nomorTelepon);
    _emailCtrl = TextEditingController(text: widget.pegawai.email);
    _passCtrl = TextEditingController(text: widget.pegawai.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "NIP"),
              controller: _nipCtrl,
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
              decoration: const InputDecoration(labelText: "Email"),
              controller: _emailCtrl,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Password"),
              controller: _passCtrl,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Pegawai updated = Pegawai(
                  id: widget.pegawai.id,
                  nip: _nipCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tglLahirCtrl.text,
                  nomorTelepon: _telpCtrl.text,
                  email: _emailCtrl.text,
                  password: _passCtrl.text,
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
