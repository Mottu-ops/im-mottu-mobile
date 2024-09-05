import 'package:christianmarvelapi/presenter/controllers/characters_controller.dart';
import 'package:christianmarvelapi/presenter/pages/description_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetX<CharactersController>(
        init: CharactersController(),
        builder: (charactersController) {
          return charactersController.isLoading.value == true ? 
          const Center(child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 22,),
              Padding(

                padding: EdgeInsets.only(left: 25),
                child: Text("Procurando Heróis...", style: TextStyle(
                  color: Color.fromARGB(255, 160, 15, 15),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none
                ),),
              )
            ],
          ),) :
          Scaffold(
            appBar: AppBar(title: const Text('Marvel |'),),
            body: ListView.builder(
            itemCount: charactersController.charactersList.length,
            itemBuilder: (context, index) {
              var heroId = charactersController.charactersList[index].id;
              var imagePath = charactersController.charactersList[index].thumbnail!.path;
              var extPath = charactersController.charactersList[index].thumbnail?.extension;
              var heroName = charactersController.charactersList[index].name;
              var descriptionHero = charactersController.charactersList[index].description;
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DescriptionPage(heroId, heroName, descriptionHero, imagePath, extPath));
                      },                 
                      child: ListTile(
                        title: Text(heroName.toString()),
                        subtitle: Text(descriptionHero == '' ? 'Secret Description' 
                        :  "${descriptionHero.toString().substring(0, 30)}..."),
                        leading:  ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network("$imagePath.$extPath", fit: BoxFit.cover, width: 60,),
                      ),
                    )
                  ),
                ],
              ),
            );
          },),
        );
      }
    );
  }
}