import 'package:flutter/material.dart';
import '/model/poli.dart';
import '/service/poli_service.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ambil data dari API (opsional) atau pakai data yang dikirim
    _getData();
  }

  Future<void> _getData() async {
    if (widget.poli.id != null) {
      Poli data = await PoliService().getById(widget.poli.id!);
      setState(() {
        _namaPoliCtrl.text = data.namaPoli;
      });
    } else {
      _namaPoliCtrl.text = widget.poli.namaPoli;
    }
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        final poli = Poli(namaPoli: _namaPoliCtrl.text, id: widget.poli.id);
        if (widget.poli.id != null) {
          await PoliService().ubah(poli, widget.poli.id!);
        }
        // kembalikan updated object ke halaman detail
        Navigator.pop(context, poli);
      },
      child: const Text("Simpan Perubahan"),
    );
  }

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
    );
  }
}
