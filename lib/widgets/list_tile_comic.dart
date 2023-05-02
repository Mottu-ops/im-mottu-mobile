import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/model/comics.dart';
import 'package:mottu_marvel/screens/details_screen.dart';
import 'package:mottu_marvel/tools/dimension_extension.dart';

class ListTileComic extends StatelessWidget {
   ListTileComic({super.key, required this.comic});

  final Comics comic;
  late double heigth;
  late double width;
  @override
  Widget build(BuildContext context) {
    if (comic.thumbnailUrl!.contains('image_not_available')) return Container();
    heigth = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // print('heigth: ${MediaQuery.of(context).size.height}'); //Pixel 6 PRO 867.42857
    // print('width: ${MediaQuery.of(context).size.width}'); // Pixel 6 PRO 411.428571
    return GestureDetector(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(comic: comic,))),
      child: Row(
        children: [
          Container(
            //150
              height:  heigth * 0.3,
              margin: EdgeInsets.only(bottom: 16, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network(comic.thumbnailUrl!))),
          16.wd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comic.title!.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                18.hg,
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const Icon(Icons.star, color: Colors.yellow),
                    const Icon(Icons.star, color: Colors.yellow),
                    const Icon(Icons.star, color: Colors.yellow),
                    4.wd,
                    const Text('4.0', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                4.hg,
                const Text(
                  'on Sale',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                4.hg,
                Padding(
                  padding: EdgeInsets.only(bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'US Price ${comic.price.map((e) => e.price)}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
