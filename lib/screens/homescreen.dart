import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomdex/api-call.dart';
import 'package:randomdex/checkInternet.dart';
import 'package:randomdex/models/pokemon-model.dart';
import 'package:randomdex/widgets/capitalizing.dart';
import 'package:randomdex/widgets/image.dart';
import 'package:randomdex/widgets/new-types.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<Pokemon> _pokemon;

  @override
  void initState() {
    super.initState();
    _pokemon = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4A5469),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            checkConnection(context);
          },
          label: Text('Generate Another Pokémon',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              )
          ),
        backgroundColor: Colors.white70,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder<Pokemon>(
                future: _pokemon,
                builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot){
                  if(snapshot.hasData){
                    final pokemon = snapshot.data;

                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        PokemonImage(url: pokemon!.imageUrl, type: pokemon.types[0]),
                        const SizedBox(height: 15),
                        Text(capitalize(pokemon.name),
                          style: GoogleFonts.play(
                              textStyle: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text('#${pokemon.id}',
                          style: GoogleFonts.play(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xffF5F5F5),
                              )
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 1,
                          color: const Color(0xff2d3748),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Types',
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                ),
                                const SizedBox(height: 15),
                                NewPokemonTypes(types: pokemon.types),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 1,
                            color: const Color(0xff2d3748),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Physical Attributes',
                                    style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Height  ',
                                          style: GoogleFonts.play(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue[200]
                                          )
                                          ),
                                          Text('Weight  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 2),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('   ${pokemon.height/10} m',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.weight/100} kg',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 1,
                            color: const Color(0xff2d3748),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Base Stats',
                                      style: GoogleFonts.breeSerif(
                                          textStyle: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w600
                                          )
                                      )
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('HP  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                          Text('Attack  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                          Text('Defense  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                          Text('Special Attack  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                          Text('Special Defense  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                          Text('Speed  ',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue[200]
                                              )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('   ${pokemon.hp}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.attack}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.defense}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.specialAttack}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.specialDefense}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              )),
                                          Text('   ${pokemon.speed}',
                                              style: GoogleFonts.play(
                                                  fontSize: 20,
                                                  color: const Color(0xffc0c0c0),
                                                  fontWeight: FontWeight.w500
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 85)
                      ],
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(
                      // child:
                      child: Column(
                        children: [
                          Text('${snapshot.error}',
                          style: GoogleFonts.play(
                            fontSize: 24
                          ),
                          ),
                          const SizedBox(height: 10),
                          Text('There seems to be an issue that prevents loading the data. Try restarting the app or get in touch with us.',
                          style: GoogleFonts.play(
                            fontSize: 18
                          ),
                          ),
                        ],
                      ),
                    );
                  }
                  else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 5,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          )
      ),
    );
  }
}
