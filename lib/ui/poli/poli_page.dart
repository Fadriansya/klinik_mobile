// lib/ui/poli_page.dart
import 'package:flutter/material.dart';
import '/model/poli.dart';
import '/service/poli_service.dart';
import 'poli_item.dart';
import 'poli_form.dart';
import '/widget/sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              // buka form tambah, lalu refresh page setelah kembali
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Poli>>(
        stream: getList(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text(snapshot.error.toString()));
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final list = snapshot.data!;
          if (list.isEmpty) return const Center(child: Text('Data Kosong'));
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return PoliItem(poli: list[index]);
            },
          );
        },
      ),
    );
  }
}
