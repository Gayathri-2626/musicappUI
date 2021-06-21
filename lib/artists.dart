import 'package:flutter/material.dart';

import 'SizeConfig.dart';
import 'artistdetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: Artists(),
            );
          },
        );
      },
    );
  }
}

class Artists extends StatefulWidget {
  Artists({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArtistsDetail()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/kutty1.jpg"))
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("Billie Eilish", style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/kutty1.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Eminem", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 90 ,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/kutty1.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Dua Lipa", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 90 ,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/kutty1.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Bruno Mars", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}