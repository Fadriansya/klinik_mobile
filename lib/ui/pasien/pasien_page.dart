import 'package:flutter/material.dart';
import '/model/pasien.dart';
import 'pasien_detail.dart';

class PasienPage extends StatelessWidget {
  const PasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh data dummy
    List<Pasien> pasienList = [
      Pasien(
        id: 1,
        nomorRm: "RM001",
        nama: "Andi",
        tanggalLahir: "12-12-1990",
        nomorTelepon: "081345678901",
        alamat: "Jl. Merdeka 1",
      ),
      Pasien(
        id: 2,
        nomorRm: "RM002",
        nama: "Rina",
        tanggalLahir: "10-05-1992",
        nomorTelepon: "081987654321",
        alamat: "Jl. Sudirman 45",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: pasienList.length,
        itemBuilder: (context, index) {
          final p = pasienList[index];
          return Card(
            child: ListTile(
              title: Text(p.nama),
              subtitle: Text(p.nomorRm),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(pasien: p),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
