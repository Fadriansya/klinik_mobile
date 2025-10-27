// lib/ui/poli_detail.dart
import 'package:flutter/material.dart';
import '/model/poli.dart';
import '/service/poli_service.dart';
import 'poli_update_form.dart';
import 'poli_page.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${widget.poli.id ?? '-'}"),
            const SizedBox(height: 8),
            Text(
              "Nama Poli : ${widget.poli.namaPoli}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // buka form update. Setelah kembali, refresh detail dengan getById
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoliUpdateForm(poli: widget.poli),
                      ),
                    );
                    if (updated != null) {
                      setState(() {
                        widget.poli.namaPoli = updated.namaPoli;
                      });
                    } else {
                      // jika update via API, bisa fetch ulang:
                      if (widget.poli.id != null) {
                        Poli fresh = await PoliService().getById(
                          widget.poli.id!,
                        );
                        setState(() {
                          widget.poli.namaPoli = fresh.namaPoli;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Ubah"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _showDeleteConfirmation(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text("Yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Tidak"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx); // tutup dialog
              if (widget.poli.id != null) {
                await PoliService().hapus(widget.poli);
              }
              // kembali ke halaman list (PoliPage)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const PoliPage()),
                (route) => false,
              );
            },
            child: const Text("YA", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
