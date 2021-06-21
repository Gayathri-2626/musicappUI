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
              home: ArtistsDetail(),
            );
          },
        );
      },
    );
  }
}

class ArtistsDetail extends StatefulWidget {
  ArtistsDetail({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ArtistsDetailState createState() => _ArtistsDetailState();
}

class _ArtistsDetailState extends State<ArtistsDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black,),
                )
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 100,
                  width: 80,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/kutty1.jpg", fit: BoxFit.cover,),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.star, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0),
              child: Text("Billie Eilish", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito-Bold',
                  fontSize: 20,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5.0),
              child: Text("42M Listeners", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Nunito-Regular',
                  fontSize: 15
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Shuffle Play", style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito-Bold',
                          fontSize: 20
                      ),),
                      SizedBox(width: 10.0,),
                      Icon(Icons.shuffle, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    artistSongs("assets/kutty1.jpg", "No Time To Die", "Billie Eilish", "4:02"),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Player('Artist songs')));
                      },
                      child: artistSongs("assets/kutty1.jpg", "Bad Guy", "Billie Eilish", "3:21"),
                    ),

                    SizedBox(height: 20.0,),
                    artistSongs("assets/kutty1.jpg", "Lovely", "Billie Eilish", "2:25"),
                    SizedBox(height: 20.0,),
                    artistSongs("assets/kutty1.jpg", "Belly Ache", "Billie Eilish", "3:54"),
                    SizedBox(height: 20.0,),
                    artistSongs("assets/kutty1.jpg", "Belly Ache", "Billie Eilish", "3:54"),
                    SizedBox(height: 20.0,),
                    artistSongs("assets/kutty1.jpg", "Belly Ache", "Billie Eilish", "3:54"),
                    SizedBox(height: 20.0,),
                    artistSongs("assets/kutty1.jpg", "Belly Ache", "Billie Eilish", "3:54"),
                  ],
                ),
              ),
            )

          ],
        ),
      ),

    );
  }

  artistSongs(String asset, String albumName, String artist, String duration) {
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
                  fontSize: 17,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
              ),),
              Text(artist, style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13,
                color: Colors.blue,
              ),),
            ],
          ),
          Spacer(),
          Text(duration, style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 13,
              color: Colors.blue
          ),),
          SizedBox(width: 20.0,),
          Icon(Icons.favorite_border, color: Colors.purple,)
        ],
      ),
    );
  }


}