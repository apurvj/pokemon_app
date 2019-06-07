import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/poke.dart';
import 'package:pokemon_app/pokedetail.dart';

void main() => runApp(MaterialApp(
  title: "Poke App",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokehub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = Pokehub.fromJson(decodedJson);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search Bar',
            onPressed: () {},
          ),
        ],
        title: Text("Pokemon App"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [Colors.deepOrange, Colors.yellowAccent]),
        ),
        child: pokeHub == null
            ? Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        )
            : GridView.count(
          crossAxisCount: 2,
          children: pokeHub.pokemon
              .map((poke) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokeDetail(
                          pokemon: poke,
                        )));
              },
              child: Hero(
                tag: poke.img,
                child: Card(
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height:
                        MediaQuery.of(context).size.height *
                            0.2,
                        width: MediaQuery.of(context).size.width *
                            0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(poke.img))),
                      ),
                      Text(
                        poke.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
              .toList(),
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "https://wallpaperplay.com/walls/full/c/d/2/200989.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage("https://wallpaperaccess.com/full/21010.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCL2FsGLn2CnKXo7eyE4Z-T1pckaV5gvmYOq5ZlSkGNUrvI2Wg2w"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9d1074fe-77ca-48b8-acc2-09e5215cedae/d79l2wx-22aec397-1d02-452d-920f-063d99018733.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzlkMTA3NGZlLTc3Y2EtNDhiOC1hY2MyLTA5ZTUyMTVjZWRhZVwvZDc5bDJ3eC0yMmFlYzM5Ny0xZDAyLTQ1MmQtOTIwZi0wNjNkOTkwMTg3MzMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YsPsmeuzMEAuVtj2Zxg_DQjfV63CQ-kLkF7yRdDek-M"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "http://wallperio.com/data/out/355/pokemon-wallpapers_616099861.png"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlj-7zjbg1BToFJX_A9ZY53Msp8yNcFfbtP6hJXlGpuHog-MJ1"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://images.alphacoders.com/276/276503.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://wallpaperplay.com/walls/full/c/d/2/200989.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage("https://wallpaperaccess.com/full/21010.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCL2FsGLn2CnKXo7eyE4Z-T1pckaV5gvmYOq5ZlSkGNUrvI2Wg2w"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9d1074fe-77ca-48b8-acc2-09e5215cedae/d79l2wx-22aec397-1d02-452d-920f-063d99018733.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzlkMTA3NGZlLTc3Y2EtNDhiOC1hY2MyLTA5ZTUyMTVjZWRhZVwvZDc5bDJ3eC0yMmFlYzM5Ny0xZDAyLTQ1MmQtOTIwZi0wNjNkOTkwMTg3MzMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YsPsmeuzMEAuVtj2Zxg_DQjfV63CQ-kLkF7yRdDek-M"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "http://wallperio.com/data/out/355/pokemon-wallpapers_616099861.png"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlj-7zjbg1BToFJX_A9ZY53Msp8yNcFfbtP6hJXlGpuHog-MJ1"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://images.alphacoders.com/276/276503.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://wallpaperplay.com/walls/full/c/d/2/200989.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage("https://wallpaperaccess.com/full/21010.jpg"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCL2FsGLn2CnKXo7eyE4Z-T1pckaV5gvmYOq5ZlSkGNUrvI2Wg2w"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9d1074fe-77ca-48b8-acc2-09e5215cedae/d79l2wx-22aec397-1d02-452d-920f-063d99018733.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzlkMTA3NGZlLTc3Y2EtNDhiOC1hY2MyLTA5ZTUyMTVjZWRhZVwvZDc5bDJ3eC0yMmFlYzM5Ny0xZDAyLTQ1MmQtOTIwZi0wNjNkOTkwMTg3MzMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YsPsmeuzMEAuVtj2Zxg_DQjfV63CQ-kLkF7yRdDek-M"),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0),
              ),
              Image(
                image: NetworkImage(
                    "http://wallperio.com/data/out/355/pokemon-wallpapers_616099861.png"),
                fit: BoxFit.contain,
              ),

            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
