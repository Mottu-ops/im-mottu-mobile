import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logo_marvel_with_background.svg',
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            prefixIconColor: Colors.black38,
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.filter_list_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: NotificationListener(
        onNotification: (OverscrollIndicatorNotification notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: List.generate(
                70,
                (index) => ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Text(index.toString()),
                  children: [
                    GestureDetector(
                      onTap: () =>
                          print('Interface detail ${index.toString()}'),
                      child: CachedNetworkImage(
                        imageUrl:
                            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/detail.jpg',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    Text('Name ${index.toString()}'),
                    Text('Description ${index.toString()}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
