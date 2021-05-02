import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageChat extends StatefulWidget {
  String name;
  String status;
  String species;
  String gender;
  String image;

  ImageChat(this.name, this.status, this.species, this.gender, this.image);

  @override
  _ImageChatState createState() =>
      _ImageChatState(name, status, species, gender, image);
}

class _ImageChatState extends State<ImageChat> {
  @override
  void initState() {
    super.initState();
  }

  _ImageChatState(
      this.name, this.status, this.species, this.gender, this.image);

  String name;
  String status;
  String species;
  String gender;
  String image;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      margin: EdgeInsets.only(top: 5.0, right: 20, left: 20),
      padding: EdgeInsets.only(top: 15.0),
      child: Stack(
        children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (this.status != 'Dead')
            Positioned(
              right: 5,
              bottom: 0,
              child: SizedBox(
                height: 20.0,
                width: 20.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.white,
                        )),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => {},
                ),
              ),
            ),
        ],
      ),
    );

    final imageName = Text(
      this.name,
      style: TextStyle(
          fontSize: 18, fontFamily: "sch", fontWeight: FontWeight.bold),
    );

    final imageDescription = Text(
      "${species}, ${gender}",
      style: TextStyle(
        fontSize: 12,
        fontFamily: "sch",
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black45,
      ),
    );

    final imageDetail = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[imageName, imageDescription],
    );

    print(this.name);
    print(this.status);
    print(this.species);
    print(this.gender);
    print(this.image);
    return Row(
      children: [image, imageDetail],
    );
  }
}
