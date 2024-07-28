class Batik {
  final String? title;
  final String? imageUrl;
  final String? description;

  Batik({this.title, this.imageUrl, this.description});

  factory Batik.fromMap(Map<String, dynamic> data) {
    return Batik(
      title: data['nama'] as String?,
      imageUrl: data['gambar'] as String?,
      description: data['deskripsi'] as String?,
    );
  }
}