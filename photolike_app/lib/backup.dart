import 'package:flutter/material.dart';

class PhotoLike extends StatefulWidget {
  const PhotoLike({Key? key}) : super(key: key);

  @override
  State<PhotoLike> createState() => _PhotoLikeState();
}

enum Action { PREVIOUS, NEXT, FAVORITE }

class _PhotoLikeState extends State<PhotoLike> {
  int image = 1;
  int favoriteCount = 0;

  void changePhoto(Action action) {
    setState(() {
      if (action == Action.NEXT && image < 5) {
        image++;
      } else if (action == Action.PREVIOUS && image > 1) {
        image--;
      }
    });
  }

  void favoritePhoto() {
    setState(() {
      favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 39, 39, 39),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/image$image.jpg',
              height: 500,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 30),
              child: Text(
                '$favoriteCount',
                style: const TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(() {
                  changePhoto(Action.PREVIOUS);
                }, Icons.navigate_before,
                    const Color.fromARGB(255, 114, 149, 179)),
                buildButton(() {
                  favoritePhoto();
                }, Icons.favorite, Colors.redAccent),
                buildButton(() {
                  changePhoto(Action.NEXT);
                }, Icons.navigate_next,
                    const Color.fromARGB(255, 114, 149, 179)),
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
