class Poli {
  String? id;
  String namaPoli;

  Poli({this.id, required this.namaPoli});

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(id: json['id']?.toString(), namaPoli: json['namaPoli'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {if (id != null) 'id': id, 'namaPoli': namaPoli};
  }
}
