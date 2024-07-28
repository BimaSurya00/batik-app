import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/view/DetailBatik/detail_batik_screen.dart';
import 'package:latihan_erico/view/SejarahBatik/sejarah_batik_screen.dart';
import 'package:latihan_erico/view/bookmark/bookmark_page.dart';
import 'package:latihan_erico/viewmodel/home_controller.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getData();
      controller.getTopBatik();
      controller.getSejarah();
    });
  }

  void _searchBatik() {
    controller.searchBatik(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 121, 85, 72),
                        Color.fromARGB(255, 190, 182, 173),
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 30, right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Selamat Datang!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Ayo belajar tentang batik!",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('MOTIF BATIK',
                  style: TextStyle(
                      color: Color(0xffAF8F6F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            //Fitur Kategori Row
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.topBatikList.map((batik) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: DetailBatikScreen(
                                  name: batik.title ?? 'No Title',
                                  imageUrl: batik.imageUrl ??
                                      'https://example.com/default-image.jpg',
                                  description:
                                      batik.description ?? 'No Description',
                                ),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 210,
                            height: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown[300],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.white,
                                  child: Image.network(
                                    batik.imageUrl ??
                                        'https://example.com/default-image.jpg',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                Text(
                                  batik.title ?? 'Motif Batik',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            }),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('SEJARAH BATIK',
                  style: TextStyle(
                      color: Color(0xffAF8F6F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            // ROW SEJARAH BATIK
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.sejarahbatik.map((batik) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: SejarahBatikScreen(
                                  name: batik.title ?? 'No Title',
                                  imageUrl: batik.imageUrl ??
                                      'https://example.com/default-image.jpg',
                                  description:
                                      batik.description ?? 'No Description',
                                ),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 430,
                            height: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown[300],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.white,
                                  child: Image.network(
                                    batik.imageUrl ??
                                        'https://example.com/default-image.jpg',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                Text(
                                  batik.title ?? 'Motif Batik',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            }),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari disini...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.brown[300],
                ),
                onChanged: (value) {
                  _searchBatik();
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.brown,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var listAllDocs = controller.batikList;
                  return ListView.builder(
                    itemCount: listAllDocs.length,
                    itemExtent: 100,
                    itemBuilder: (context, index) {
                      if (index >= listAllDocs.length) {
                        return const SizedBox.shrink();
                      }
                      var batik = listAllDocs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: DetailBatikScreen(
                                name: batik.title ?? 'No Title',
                                imageUrl: batik.imageUrl ??
                                    'https://example.com/default-image.jpg',
                                description:
                                    batik.description ?? 'No Description',
                              ),
                              type: PageTransitionType.rightToLeft,
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
                                batik.imageUrl!,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      batik.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      batik.description!,
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
                }
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const BookmarkPage(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        backgroundColor: const Color(0xFFAF8F6F),
        child: const Icon(
          Icons.bookmark,
          color: Color(0xFF5E2C07),
        ),
      ),
    );
  }
}
