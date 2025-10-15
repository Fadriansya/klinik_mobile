import 'package:flutter/material.dart';
import '/model/pegawai.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NIP: ${widget.pegawai.nip}"),
            Text("Nama: ${widget.pegawai.nama}"),
            Text("Tanggal Lahir: ${widget.pegawai.tanggalLahir}"),
            Text("Nomor Telepon: ${widget.pegawai.nomorTelepon}"),
            Text("Email: ${widget.pegawai.email}"),
            Text("Password: ${widget.pegawai.password}"),
            const SizedBox(height: 20),

            // Tombol Ubah
            ElevatedButton(
              onPressed: () async {
                final updatedPegawai = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PegawaiUpdateForm(pegawai: widget.pegawai),
                  ),
                );
                if (updatedPegawai != null) {
                  setState(() {
                    widget.pegawai.nama = updatedPegawai.nama;
                    widget.pegawai.nip = updatedPegawai.nip;
                    widget.pegawai.tanggalLahir = updatedPegawai.tanggalLahir;
                    widget.pegawai.nomorTelepon = updatedPegawai.nomorTelepon;
                    widget.pegawai.email = updatedPegawai.email;
                    widget.pegawai.password = updatedPegawai.password;
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
              Navigator.pop(context); // kembali ke halaman list Pegawai
              // catatan: di sini bisa tambahkan logika hapus data dari list/DB
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }
}
