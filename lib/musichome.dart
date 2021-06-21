import 'package:flutter/material.dart';
import 'package:music_app/artistdetail.dart';
import 'SizeConfig.dart';
import 'albums.dart';
import 'artists.dart';
import 'drawer.dart';
import 'podcasts.dart';
import 'playlist.dart';

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
              home: MusicHome(),
            );
          },
        );
      },
    );
  }
}

class MusicHome extends StatefulWidget {
  MusicHome({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MusicHomeState createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> with SingleTickerProviderStateMixin{

  int _currentIndex=0;
  final tabs=[
    Center(child: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('camera',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
  ];
  TabController _tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music Player"),
          centerTitle: true,
    elevation: 100,

    ),
    drawer: Drawer(
    child: MainDrawer(),
    ),
    body: DefaultTabController(
    length: 4,
    child: Column(
    children: [
    Container(
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Colors.blue,
    Colors.purple
    ],
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter),),
            child: TabBar(
                controller: _tabcontroller,
                indicatorColor: Colors.white70,
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold
                ),
                unselectedLabelColor: Colors.white70,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text("ALBUMS", style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Nunito'
                    ),),
                  ),
                  Tab(
                    child: Text("ARTISTS", style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Nunito'
                    ),),
                  ),
                  Tab(
                    child: Text("PODCASTS", style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Nunito'
                    ),),
                  ),

                  Tab(
                    child: Text("PLAYLIST", style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Nunito'
          ),),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                  controller: _tabcontroller,
                  children: <Widget>[
                    Albums(),
                    Artists(),
                    Podcasts(),
                    Playlist(),
                  ]),
            ),
          )
        ],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home,color: Colors.white),
              title: Text('Home',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.search,color: Colors.white),
              title: Text('Search',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.music_note,color: Colors.white),
              title: Text('Music',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.person,color: Colors.white),
              title: Text('Profile',style: TextStyle(color: Colors.white),),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),


    );
  }
}