import 'package:flutter/material.dart';
import '/model/pasien.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pasien")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nomor RM: ${widget.pasien.nomorRm}"),
            Text("Nama: ${widget.pasien.nama}"),
            Text("Tanggal Lahir: ${widget.pasien.tanggalLahir}"),
            Text("Nomor Telepon: ${widget.pasien.nomorTelepon}"),
            Text("Alamat: ${widget.pasien.alamat}"),
            const SizedBox(height: 20),

            // Tombol Ubah
            ElevatedButton(
              onPressed: () async {
                final updatedPasien = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PasienUpdateForm(pasien: widget.pasien),
                  ),
                );
                if (updatedPasien != null) {
                  setState(() {
                    widget.pasien.nomorRm = updatedPasien.nomorRm;
                    widget.pasien.nama = updatedPasien.nama;
                    widget.pasien.tanggalLahir = updatedPasien.tanggalLahir;
                    widget.pasien.nomorTelepon = updatedPasien.nomorTelepon;
                    widget.pasien.alamat = updatedPasien.alamat;
                  });
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Ubah", style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 10),

            // Tombol Hapus
            ElevatedButton(
              onPressed: () {
                _showDeleteConfirmation(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Hapus", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi dialog konfirmasi hapus
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Apakah Anda yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              Navigator.pop(context); // kembali ke halaman list Pasien
              // Catatan: di sini bisa tambahkan logika hapus data dari list/DB
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }
}
