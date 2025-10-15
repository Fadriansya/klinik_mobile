import 'package:flutter/material.dart';
import '/model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
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
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Pegawai baru = Pegawai(
                  id: 0,
                  nip: _nipCtrl.text,
                  nama: _namaCtrl.text,
                  tanggalLahir: _tglLahirCtrl.text,
                  nomorTelepon: _telpCtrl.text,
                  email: _emailCtrl.text,
                  password: _passCtrl.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PegawaiDetail(pegawai: baru),
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
