// lib/ui/poli_form.dart
import 'package:flutter/material.dart';
import '/model/poli.dart';
import '/service/poli_service.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_namaPoliCtrl.text.trim().isEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Isi nama poli')));
          return;
        }
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text.trim());
        await PoliService().simpan(poli);
        // kembali ke halaman list dan refresh
        Navigator.pop(context);
      },
      child: const Text("Simpan"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                controller: _namaPoliCtrl,
                decoration: const InputDecoration(labelText: "Nama Poli"),
              ),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }
}
