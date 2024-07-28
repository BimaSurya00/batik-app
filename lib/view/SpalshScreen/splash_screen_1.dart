import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:latihan_erico/view/BottomNavbar/bottom_navbar_screen.dart';

import 'package:latihan_erico/view/widget/button_custome.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Colors.brown,
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: Color(0xffAF8F6F),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: Color(0xffAF8F6F), fontSize: 20),
            ),
            title: 'Selamat Datang di Batik.co',
            body: 'Eksplorasi Motif, Sejarah, dan Filosofi Batik Nusantara',
            image: Container(
              padding: const EdgeInsets.only(top: 150),
              width: double.infinity,
              child: Image.asset(
                'assets/gambar/logo-batikco1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageViewModel(
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: Color(0xffAF8F6F),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: Color(0xffAF8F6F), fontSize: 20),
            ),
            title: 'Selamat Datang di Batik.co',
            body: 'Temukan Kekayaan Warisan Budaya Indonesia',
            image: Container(
              padding: const EdgeInsets.only(top: 150),
              width: double.infinity,
              child: Image.asset(
                'assets/gambar/logo-batikco1.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        onDone: () {},
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          activeSize: const Size(20, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        showBackButton: false,
        showDoneButton: false,
        showSkipButton: false,
        showNextButton: false,
        globalFooter: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ButtonCustome(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const BottomNavbarScreen(
                      currentIndex: 0,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              title: 'Masuk',
              backgroundColour: Colors.white,
              width: 274,
              style: const TextStyle(color: Colors.brown)),
        ));
  }
}
