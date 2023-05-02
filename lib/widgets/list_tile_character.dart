import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/tools/dimension_extension.dart';

import '../model/character.dart';
import '../screens/details_screen.dart';
class ListTileCharacter extends StatelessWidget {
   ListTileCharacter(this.character, {super.key});
  final Character character;
  late double heigth;
  late double width;
  @override
  Widget build(BuildContext context) {
    if(character.thumbnailPath!.toLowerCase().contains('image_not_available')) return Container();
    heigth = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // print('heigth: ${MediaQuery.of(context).size.height}'); //Pixel 6 PRO 867.42857
    // print('width: ${MediaQuery.of(context).size.width}');// Pixel 6 PRO 411.428571
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(character: character))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              //altura imagem: 300
              child: Image.network(character.thumbnailPath!,height: heigth * 0.3 ),
            ),
          ),
          8.hg,
          //TODO pesquisar se o Text tem algum Método para quebrar linhas dependendo do tamanho do character.name!
          Text(character.name!.toUpperCase(), style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    );
  }
}
