import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/viewmodel/add_to_bookmark_controller.dart';

class DetailBatikScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String description;

  const DetailBatikScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<DetailBatikScreen> createState() => _DetailBatikScreenState();
}

class _DetailBatikScreenState extends State<DetailBatikScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('Detail Batik'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.brown[100],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
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
              }, width: 390, height: 250),
              const SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 1150,
                child: Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.brown[100],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<AddToBookmarkViewModel>().addToBookmark(
            widget.name,
            widget.imageUrl,
            widget.description,
          );
        },
        backgroundColor: const Color(0xFFAF8F6F),
        child: const Icon(
          Icons.add,
          color: Color(0xFF5E2C07),
        ),
      ),
    );
  }
}
