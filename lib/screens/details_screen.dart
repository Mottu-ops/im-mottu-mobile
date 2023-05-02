import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/model/comics.dart';
import 'package:mottu_marvel/tools/dimension_extension.dart';
import '../model/character.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, this.character, this.comic});

  final Comics? comic;
  final Character? character;

  late double heigth;
  late double width;

  @override
  Widget build(BuildContext context) {
    heigth = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: const Stack(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 26,
                ),
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: CircleAvatar(
                    maxRadius: 7,
                    backgroundColor: Colors.red,
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            16.hg,
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      comic != null
                          ? comic!.thumbnailUrl!
                          : character!.thumbnailUrl!,
                      height: heigth * 0.4),
                ),
              ),
            ),
            18.hg,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                comic != null ? comic!.title! : character!.name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            12.hg,
            comic != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '4.0',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      8.wd,
                      const Icon(Icons.star, color: Colors.yellow),
                      const Icon(Icons.star, color: Colors.yellow),
                      const Icon(Icons.star, color: Colors.yellow),
                      const Icon(Icons.star, color: Colors.yellow),
                    ],
                  )
                : Container(),
            16.hg,
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  comic != null ? comic!.description! : character!.description!,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            //character!.name!.toLowerCase() == "adam warlock" ?  Image.asset('images/adam-warlock.gif') : Container()
          ],
        ),
      ),
        bottomNavigationBar: comic != null ?   Container(
          margin: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            child: Row(
              children: [
                Spacer(),
                Text('Buy Full Version'),
                Spacer(),
                Icon(Icons.shopping_bag_outlined, size: 18),
              ],
            ),
          ),
        ) : Container(
          width: 0,
          height: 0,
        ),
    );
  }
}
