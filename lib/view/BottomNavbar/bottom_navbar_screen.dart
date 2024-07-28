import 'package:flutter/material.dart';
import 'package:latihan_erico/view/RagamBatik/ragam_batik_screen.dart';
import 'package:latihan_erico/view/home/home_page.dart';
import 'package:latihan_erico/view/kota/kota_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  final int currentIndex;
  const BottomNavbarScreen({super.key, required this.currentIndex});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int index = 0;
  final List<Widget> pages = [
    const HomePage(),
    const RagamBatikScreen(),
    const KotaScreen()
  ];

  @override
  void initState() {
    super.initState();
    index = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome), label: 'Ragam'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: 'Kota')
        ],
      ),
    );
  }
}
