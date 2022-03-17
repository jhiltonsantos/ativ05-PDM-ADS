import 'package:flutter/material.dart';

class PhotoLikePage extends StatefulWidget {
  const PhotoLikePage({Key? key}) : super(key: key);

  @override
  State<PhotoLikePage> createState() => _PhotoLikePageState();
}

enum Action { PREVIOUS, NEXT }

class _PhotoLikePageState extends State<PhotoLikePage> {
  int image = 1;

  Map<String, int> favorite = {
    'image1': 0,
    'image2': 0,
    'image3': 0,
    'image4': 0,
    'image5': 0
  };
  int favoriteCurrent = 0;
  Color colorFavoriteButton = Colors.grey;
  Color buttonNavigator = const Color.fromARGB(255, 114, 149, 179);

  void changePhoto(Action action) {
    setState(() {
      if (action == Action.NEXT && image < 5) {
        image++;
      } else if (action == Action.PREVIOUS && image > 1) {
        image--;
      }
      updateStatusButtons();
    });
  }

  void favoritePhoto() {
    setState(() {
      favorite.forEach((key, value) {
        if (key == 'image$image' && value == 0) {
          favorite.update(key, (value) => 1);
          favoriteCurrent = favorite[key]!;
        } else if (key == 'image$image' && value == 1) {
          favorite.update(key, (value) => 0);
          favoriteCurrent = favorite[key]!;
        }
      });
      updateStatusButtons();
    });
  }

  void updateStatusButtons() {
    setState(() {
      favorite.forEach((key, value) {
        if (key == 'image$image') {
          favoriteCurrent = favorite[key]!;
        }
      });
      if (favoriteCurrent == 1) {
        colorFavoriteButton = Colors.redAccent;
      } else {
        colorFavoriteButton = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 39, 39, 39),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/images/image$image.jpg',
              height: 500,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(() {
                  changePhoto(Action.PREVIOUS);
                }, Icons.navigate_before, buttonNavigator),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      favoritePhoto();
                    });
                  },
                  elevation: 2.0,
                  fillColor: colorFavoriteButton,
                  child: const Icon(Icons.favorite,
                      size: 48.0, color: Colors.white),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                ),
                buildButton(() {
                  changePhoto(Action.NEXT);
                }, Icons.navigate_next, buttonNavigator),
              ],
            )
          ],
        ),
      )),
    );
  }
}

RawMaterialButton buildButton(
    Function()? onPressed, IconData icon, Color color) {
  return RawMaterialButton(
    onPressed: onPressed,
    elevation: 2.0,
    fillColor: color,
    child: Icon(icon, size: 48.0, color: Colors.white),
    padding: const EdgeInsets.all(15.0),
    shape: const CircleBorder(),
  );
}
