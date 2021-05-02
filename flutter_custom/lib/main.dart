import 'package:flutter/material.dart';
import 'package:flutter_custom/widgets/image_chat.dart';
import 'package:flutter_custom/widgets/image_status.dart';

import 'models/Character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> imagesInfo(List<Character> listCh) {
    List<Widget> mList = [];
    if (listCh.isNotEmpty) {
      for (var i = 0; i < listCh.length; i++) {
        mList.add(new ImageStatus(listCh[i].image, listCh[i].name));
      }
    }
    return mList;
  }

  List<Widget> imagesChat(List<Character> listCh) {
    List<Widget> mList = [];
    if (listCh.isNotEmpty) {
      for (var i = 0; i < listCh.length; i++) {
        mList.add(new ImageChat(listCh[i].name, listCh[i].status,
            listCh[i].species, listCh[i].gender, listCh[i].image));
        //mList.add(new ImageChat(listCh[i].image, listCh[i].name));
      }
    }
    return mList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Character>>(
          future: fetchPost(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.all(5),
                      child: ListView(
                        children: <Widget>[...imagesInfo(snapshot.data)],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      child: ListView(
                        children: <Widget>[...imagesChat(snapshot.data)],
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error\n${snapshot.error}",
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
