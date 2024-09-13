import 'package:christianmarvelapi/presenter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marvel |',    
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 184, 33, 22),
        foregroundColor: Colors.white,   
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
        useMaterial3: true,     
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}