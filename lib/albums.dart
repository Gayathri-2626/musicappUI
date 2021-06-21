import 'package:flutter/material.dart';
import 'package:music_app/player.dart';
import 'SizeConfig.dart';

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
              home: Albums(),
            );
          },
        );
      },
    );
  }
}

class Albums extends StatefulWidget {
  Albums({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

  var list=['assets/kutty1.jpg','assets/kutty1.jpg','assets/kutty1.jpg','assets/kutty1.jpg'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // children: <Widget>[
                  //   _albumCard("assets/kutty1.jpg"),
                  //   SizedBox(width: 10.0,),
                  //   _albumCard("assets/kutty1.png"),
                  //   SizedBox(width: 10.0,),
                  //   _albumCard("assets/kutty1.jpg"),
                  // ],
                  children: List.generate(list.length, (index) => _albumCard(list[index])),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: Text("Playlists", style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Nunito-Regular',
                  fontSize: 25
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                    onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Player('Helo',)));
              },
                child: playListCard("assets/kutty1.jpg", "No Time To Die", "Billie Eilish", "4:02"),
                    ),
                     SizedBox(height: 20.0,),
                    playListCard("assets/kutty1.jpg", "Don\'t start now", "Dua Lipa", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/kutty1.jpg", "Godzilla", "Eminem", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/kutty1.jpg", "Belly Ache", "Billie Eilish", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/kutty1.jpg", "No Time To Die", "Billie Eilish", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/kutty1.jpg", "No Time To Die", "Billie Eilish", "4:02"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }

  _albumCard(String assetImg) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Player('Album card')));
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(assetImg, fit: BoxFit.cover, height: 100,width: 90, ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Icon(Icons.play_arrow, color: Colors.black26,),
              ),
            )
          ],
        ),
      ),
    );
  }

  playListCard(String asset, String albumName, String artist, String duration) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(asset, fit: BoxFit.cover, height: 35, width: 35,),
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(albumName, style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
              ),),
              Text(artist, style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 12,
                color: Colors.blue,
              ),),
            ],
          ),
          Spacer(),
          Text(duration, style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12,
              color: Colors.blue
          ),),
          SizedBox(width: 20.0,),
          Icon(Icons.favorite_border, color: Colors.purple,)
        ],
      ),
    );
  }
}