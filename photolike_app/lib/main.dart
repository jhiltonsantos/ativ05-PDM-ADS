import 'package:flutter/material.dart';

import 'photolike_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhotoLikePage(),
    );
  }
}

/*
Map<String, int> favorite = {
    'image1': 0,
    'image2': 0,
    'image3': 0,
    'image4': 0,
    'image5': 0
  };

  */

  /*
favorite.forEach((key, value) {
        if (key == 'image$image') {
          value++;
        }
      });

      */