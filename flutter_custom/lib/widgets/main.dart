import 'package:flutter/material.dart';
import 'package:taller_custom/models/Character.dart';
import 'package:taller_custom/widgets/image_status.dart';

class Main extends StatefulWidget {
  var characters = [];
  @override
  _MainState createState() => _MainState(characters);
}

class _MainState extends State<Main> {
  var characters = [];

  _MainState(this.characters);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> imagesInfo() {
    List<Widget> mList = [];
    if (this.characters.isNotEmpty) {
      for (var i = 0; i < this.characters.length; i++) {
        mList.add(new ImageStatus(characters[i].image, characters[i].name));
      }
    }
    return mList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[...imagesInfo()],
          scrollDirection: Axis.horizontal,
        ),
      ],
    );
  }
}
