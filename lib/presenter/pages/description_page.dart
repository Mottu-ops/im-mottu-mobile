import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatelessWidget {
   final int? heroId;
   final String? heroName;
   final String? descriptionHero;
   final String? image;
   final String? ext;

   DescriptionPage(this.heroId, this.heroName, this.descriptionHero, this.image, this.ext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(heroName.toString()),),
      body: ListView(
       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),   
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("$image.$ext", fit: BoxFit.cover, height: 300,
               width: MediaQuery.of(context).size.width),
              const SizedBox(height: 10,),    
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(      
                      color: const Color.fromARGB(255, 167, 3, 3),
                      width: 100,
                      child: Center(child: Text(heroId.toString(), 
                      style: const TextStyle(fontSize: 15, color: Colors.white),                      
                      ),
                    ),
                  ),
                ),
              ),      
              const SizedBox(height: 10,),
              Text(heroName.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(descriptionHero.toString() == '' 
                  ? 'Secret Description' : descriptionHero.toString(), style: const TextStyle(fontSize: 14, 
                  fontWeight:FontWeight.bold ),),
              ),
          ],)
        ],       
      ),
    );
  }
}