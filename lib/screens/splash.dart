import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomdex/checkInternet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // final data = FetchAPIs().fetchPokemon();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => checkConnection(context),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xff737373)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/new-logo.png'),
                      ),
                    ),
                  ),
                  Text('Randomdex',
                    style: GoogleFonts.breeSerif(
                        fontSize: 40,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w800
                    ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
