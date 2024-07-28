import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/view/DetailBatik/detail_batik_screen.dart';
import 'package:latihan_erico/viewmodel/home_controller.dart';

class RagamBatikScreen extends StatefulWidget {
  const RagamBatikScreen({super.key});

  @override
  State<RagamBatikScreen> createState() => _RagamBatikScreenState();
}

class _RagamBatikScreenState extends State<RagamBatikScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        foregroundColor: Colors.brown[100],
        backgroundColor: Colors.brown,
        title: const Text('Ragam Batik'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var listAllDocs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listAllDocs.length,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  var data = listAllDocs[index].data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailBatikScreen(
                            name: data['nama'] ?? 'No Title',
                            imageUrl: data['gambar'] ??
                                'https://example.com/default-image.jpg',
                            description: data['deskripsi'] ?? 'No Description',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.brown[300],
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Image.network(
                            data['gambar'] ??
                                'https://example.com/default-image.jpg',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['nama'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  data['deskripsi'] ?? 'No Description',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
