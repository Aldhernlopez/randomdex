import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomdex/checkInternet.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8e8e8e),
      appBar: AppBar(
        title: Text('Randomdex',
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24
                )
            )
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff757F9A),
                  Color(0xffD7DDE8),
                ]
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                  width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/sleep.gif'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Uh Oh!',
                style: GoogleFonts.play(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600
                    ),
                ),
              ),
              const SizedBox(height: 5),
              Text('Looks like there\'s an issue with your Internet connection. Check the connection and try again.',
                style: GoogleFonts.play(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (){
                    checkConnection(context);
                  },
                  child: Text('Try Again',
                      style: GoogleFonts.breeSerif(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
              )),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
