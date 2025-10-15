import 'package:flutter/material.dart';
import '/model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiPage extends StatelessWidget {
  const PegawaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh data dummy
    List<Pegawai> pegawaiList = [
      Pegawai(
        id: 1,
        nip: "19800101",
        nama: "Budi",
        tanggalLahir: "01-01-1980",
        nomorTelepon: "081234567890",
        email: "budi@mail.com",
        password: "12345",
      ),
      Pegawai(
        id: 2,
        nip: "19850505",
        nama: "Siti",
        tanggalLahir: "05-05-1985",
        nomorTelepon: "081298765432",
        email: "siti@mail.com",
        password: "abcdef",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView.builder(
        itemCount: pegawaiList.length,
        itemBuilder: (context, index) {
          final p = pegawaiList[index];
          return Card(
            child: ListTile(
              title: Text(p.nama),
              subtitle: Text(p.nip),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PegawaiDetail(pegawai: p),
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
