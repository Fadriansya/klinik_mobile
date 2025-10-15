import 'package:flutter/material.dart';
import 'package:klinik_app/ui/beranda.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';
import 'package:klinik_app/ui/pegawai/pegawai_page.dart';
import 'package:klinik_app/ui/pasien/pasien_page.dart';
import '../ui/login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("admin@admin.com"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text("Poli"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Pegawai"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Pasien"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
