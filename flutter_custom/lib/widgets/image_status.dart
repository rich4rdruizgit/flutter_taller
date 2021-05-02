import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageStatus extends StatefulWidget {
  String image;
  String name;

  ImageStatus(this.image, this.name);

  @override
  _ImageStatusState createState() => _ImageStatusState(image, name);
}

class _ImageStatusState extends State<ImageStatus> {
  @override
  void initState() {
    super.initState();
  }

  _ImageStatusState(this.image, this.name);

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5.0, right: 20),
          padding: EdgeInsets.only(top: 15.0),
          child: SizedBox(
            height: 80.0,
            width: 80.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, right: 20),
          padding: EdgeInsets.only(top: 15.0),
          child: Stack(
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 12,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 10
                    ..color = Colors.black,
                  fontFamily: "sch",
                ),
              ),
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 12,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Color(0xFFd1e761),
                  fontFamily: "sch",
                ),
              ),
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF12b0c9),
                  fontFamily: "sch",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
