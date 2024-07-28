import 'package:cloud_firestore/cloud_firestore.dart';

class Kota {
  final String id;
  final String nama;

  Kota({required this.id, required this.nama});

  factory Kota.fromDocument(DocumentSnapshot doc) {
    return Kota(
      id: doc.id,
      nama: doc['nama'],
    );
  }
}

class Batik {
  final String id;
  final String nama;
  final String imageUrl;
  final String deskripsi;
  final String kotaId;

  Batik({
    required this.id,
    required this.nama,
    required this.imageUrl,
    required this.deskripsi,
    required this.kotaId,
  });

  factory Batik.fromDocument(DocumentSnapshot doc) {
    return Batik(
      id: doc.id,
      nama: doc['nama'],
      imageUrl: doc['gambar'],
      deskripsi: doc['deskripsi'],
      kotaId: doc['kota_id'],
    );
  }
}
