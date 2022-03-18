import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photolike_app/data/database_helper.dart';
import 'package:photolike_app/domain/photo.dart';
import 'package:photolike_app/pages/photolike_page.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({Key? key}) : super(key: key);

  @override
  _AddPhotoPageState createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  late DatabaseHelper dbHelper;
  late Photo _photo;

  @override
  void initState() {
    super.initState();
    this.dbHelper = DatabaseHelper();
    this.dbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageAux = File(image.path);
      setState(() {
        this.image = imageAux;
      });
    } on PlatformException catch (e) {
      print('Falha ao pegar imagem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image != null
                  ? Image.file(
                      image!,
                      height: 160,
                      width: 160,
                    )
                  : Image.asset(
                      'assets/images/image1.jpg',
                      height: 160,
                      width: 160,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildButton(() {
                        pickImage(ImageSource.gallery);
                      }, Icons.image_outlined, Colors.green),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Pegar Imagem',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildButton(() {
                        pickImage(ImageSource.camera);
                      }, Icons.camera_alt_outlined, Colors.indigoAccent),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'TIrar Foto',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      child: const Text('Enviar'),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
