import 'package:flutter/material.dart';
import 'package:latihan_erico/model/detail_batik_model.dart';

class BookmarkDetailPage extends StatelessWidget {
  final Bookmark batik;

  const BookmarkDetailPage({
    super.key,
    required this.batik,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text(batik.name),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.brown[100],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                batik.name,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[100]),
              ),
              const SizedBox(height: 16.0),
              Image.network(
                batik.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Text(
                batik.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.brown[100],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
