// ignore_for_file: file_names

class Employee {
  String? id = '';
  final String? nik;
  final String? nama;
  final String? jenisKelamin;
  final String? golongan;
  final int? gajiPokok;
  final int? tunjangan;
  final int? potongan;
  final int? totalGaji;

  Employee(
      {this.id = '',
      required this.nik,
      required this.nama,
      required this.jenisKelamin,
      required this.golongan,
      required this.gajiPokok,
      required this.tunjangan,
      required this.potongan,
      required this.totalGaji});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nik': nik,
        'nama': nama,
        'jenisKelamin': jenisKelamin,
        'golongan': golongan,
        'gajiPokok': gajiPokok,
        'tunjangan': tunjangan,
        'potongan': potongan,
        'totalGaji': totalGaji,
      };

  static Employee fromJson(Map<String, dynamic> json) {
    return Employee(
        nik: json['nik'],
        nama: json['nama'],
        jenisKelamin: json['jenisKelamin'],
        golongan: json['golongan'] ?? '',
        gajiPokok: json['gajiPokok'],
        tunjangan: json['tunjangan'],
        potongan: json['potongan'],
        totalGaji: json['totalGaji']);
  }
}
