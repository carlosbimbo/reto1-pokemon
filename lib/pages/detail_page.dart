import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex_main/models/pokemon_model.dart';
import 'package:flutter_codigo_pokedex_main/ui/general/colors.dart';
import 'package:flutter_codigo_pokedex_main/ui/widgets/item_data_widget.dart';
import 'package:flutter_codigo_pokedex_main/ui/widgets/item_type_widget.dart';

class DetailPage extends StatelessWidget {
  PokemonModel pokemon;

  DetailPage({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: pokemon.type
                          .map((e) => ItemTypeWidget(text: e))
                          .toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //Data del Pokemon
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ItemDataWidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataWidget(
                              title: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataWidget(
                              title: "Candy",
                              data: pokemon.candy,
                            ),
                            ItemDataWidget(
                              title: "Candy Count",
                              data: pokemon.candycount.toString() == 'null'
                                  ? ''
                                  : pokemon.candycount.toString(),
                            ),
                            ItemDataWidget(
                              title: "Egg",
                              data: pokemon.egg,
                            ),
                            const SizedBox(
                              height: 16.0,
                              child: VerticalDivider(
                                color: Colors.white30,
                                thickness: 1.0,
                              ),
                            ),
                            Visibility(
                              visible:
                                  pokemon.multipliers == null ? false : true,
                              child: Text(
                                'Multipliers',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 0,
                                ),
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            height: 32.0,
                                            child: VerticalDivider(
                                              color: Colors.white30,
                                              thickness: 1.0,
                                            ),
                                          ),
                                          SizedBox(
                                            child: pokemon.multipliers == null
                                                ? Text('')
                                                : Row(
                                                    children: [
                                                      ...pokemon.multipliers!
                                                          .map((e) => Container(
                                                                margin: const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        10.0),
                                                                child: Chip(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .amber,
                                                                  labelStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  label: Text(e
                                                                      .toString()),
                                                                ),
                                                              ))
                                                    ], // OPTION 2 using spread operator
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  pokemon.weaknesses == null ? false : true,
                              child: Text(
                                'Weaknesses',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 0,
                                ),
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            height: 32.0,
                                            child: VerticalDivider(
                                              color: Colors.white30,
                                              thickness: 1.0,
                                            ),
                                          ),
                                          SizedBox(
                                            child: pokemon.weaknesses == null
                                                ? Text('')
                                                : Row(
                                                    children: [
                                                      ...pokemon.weaknesses!
                                                          .map((e) => Container(
                                                                margin: const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        10.0),
                                                                child: Chip(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .lightBlue,
                                                                  labelStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  label: Text(e
                                                                      .toString()),
                                                                ),
                                                              ))
                                                    ], // OPTION 2 using spread operator
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Imagen del Pokemon
                      Positioned.fill(
                        top: -90.0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(pokemon.img),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
