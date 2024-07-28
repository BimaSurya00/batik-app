import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/viewmodel/home_controller.dart';
import 'package:latihan_erico/view/kota/kota_batik_screen.dart';

class KotaScreen extends StatefulWidget {
  const KotaScreen({super.key});

  @override
  State<KotaScreen> createState() => _KotaScreenState();
}

class _KotaScreenState extends State<KotaScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        foregroundColor: Colors.brown[100],
        backgroundColor: Colors.brown,
        title: const Text('Kota Batik'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.streamCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var listAllDocs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listAllDocs.length,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  var data = listAllDocs[index].data() as Map<String, dynamic>;
                  return Container(
                    width: 300,
                    height: 100,
                    // color: Colors.brown[100],
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.brown[300],
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        data['nama'] ?? 'No Name',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BatikListScreen(cityName: data['nama']),
                          ),
                        );
                      },
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
