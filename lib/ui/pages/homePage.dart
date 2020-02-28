import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:m2_app/data/models/pokemon.dart';
import 'package:m2_app/ui/pages/pokemondetail.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url =
      "https://raw.githubusercontent.com/biuni/pokemonGo-pokedex/master/pokedex.json";

  Poke poke;

  @override
  void initState(){
     super.initState();

     fetchData();

  }

  fetchData() async{
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    poke = Poke.fromJson(decodedJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon App"),
        backgroundColor: Colors.lightBlueAccent,
      ),

      body: poke == null?
          Center(
            child: CircularProgressIndicator(),
          )
          : GridView.count(
          crossAxisCount: 2,
          children: poke.pokemon
              .map((poke) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokeDetail(
                             poke,
                      )));
                    
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(poke.img)),
                          )
                        ),
                        Text(
                            poke.name,
                        )
                      ]
                    )
                  ),
                )
              )



          ).toList(),
      ),
    );
  }
}

