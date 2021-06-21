import 'dart:ui';

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(accountName: Text("Gayathri"), accountEmail: Text("gayathrivpm17@gmail.com"),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 50.0,
                  child: Tab(icon: Icon(Icons.queue_music_outlined,size: 40,),),
                ), ),

              ListTile(
                title: Text("Library",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.my_library_music_sharp),
              ),
              Divider(height: 2.0,),
              ListTile(
                title: Text("Off musics",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.music_off),
              ),
              Divider(height: 2.0,),

              ListTile(
                title: Text("Social",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.people),
              ),
              Divider(height: 2.0,),

              ListTile(
                title: Text("Primary",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.inbox),
              ),
              Divider(height: 2.0,),

              ListTile(
                title: Text("Promotions",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.local_offer),
              ),
              Divider(height: 2.0,),
            ],
          ),
        )
    );
  }
}
