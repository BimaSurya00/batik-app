import 'package:flutter/material.dart';

class SejarahBatikScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String description;
  const SejarahBatikScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<SejarahBatikScreen> createState() => _SejarahBatikScreenState();
}

class _SejarahBatikScreenState extends State<SejarahBatikScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('Sejarah Batik'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.brown[100],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: Colors.brown[100],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(widget.imageUrl, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              }, loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }, width: 380, height: 250),
              const SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 1150,
                child: Text(widget.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.brown[100],
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
