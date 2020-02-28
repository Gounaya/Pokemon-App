

import 'package:flutter/material.dart';
import 'package:m2_app/data/models/pokemon.dart';

class PokeDetail extends StatelessWidget {

  Poke pokemon;

  PokeDetail(pokeman)
      {pokeman = this.pokemon;}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Poke Detail"),),
    );
  }
}
