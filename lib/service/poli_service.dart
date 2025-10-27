// lib/service/poli_service.dart
import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../model/poli.dart';

class PoliService {
  Future<List<Poli>> listData() async {
    final Response response = await ApiClient().get('poli');
    List data = response.data as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  Future<Poli> simpan(Poli poli) async {
    final Response response = await ApiClient().post('poli', poli.toJson());
    return Poli.fromJson(response.data);
  }

  Future<Poli> ubah(Poli poli, String id) async {
    final Response response = await ApiClient().put('poli/$id', poli.toJson());
    return Poli.fromJson(response.data);
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/$id');
    return Poli.fromJson(response.data);
  }

  Future<Poli> hapus(Poli poli) async {
    final Response response = await ApiClient().delete('poli/${poli.id}');
    return Poli.fromJson(response.data);
  }
}
