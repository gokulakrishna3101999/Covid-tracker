import 'package:covid19/contacts.dart';
import 'package:covid19/states.dart';
import 'package:covid19/summary.dart';
import 'package:covid19/testStats.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID TRACKER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: AnimatedSplash(
              imagePath: 'resources/logo.jpg',
              home: MyHomePage(),
              duration: 3000,
              type: AnimatedSplashType.StaticDuration,
            ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
     appBar: new AppBar
     (
       elevation: 0.5,
       centerTitle: true,
       title: new Text("COVID - 19",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
     ), 
     drawer: new Drawer
     (
       child: ListView
       (
         children: <Widget>
         [
           new UserAccountsDrawerHeader
           (
             accountName: null, 
             accountEmail: null,
           ), 
           SizedBox
           (
             height: 5.0,
           ),
           InkWell
           (
           onTap: ()
           {
              Navigator.push(
               context, MaterialPageRoute(builder: (BuildContext context) => StateReport()));
           },
           child: ListTile
                  (
                   leading: Icon(Icons.home,color: Colors.grey,size: 25.0,),
                   title: new Text("States", style: new TextStyle(color: Colors.grey,fontSize: 19.0)),
                  ),
            ),
           InkWell
           (
           onTap: ()
           {
              Navigator.push(
               context, MaterialPageRoute(builder: (BuildContext context) => Testing()));
           },
           child: ListTile
                  (
                   leading: Icon(Icons.person,color: Colors.grey,size: 25.0,),
                   title: new Text("Test Stats", style: new TextStyle(color: Colors.grey,fontSize: 19.0)),
                  ),
           ),
           InkWell
           (
           onTap: ()
           {
              Navigator.push(
               context, MaterialPageRoute(builder: (BuildContext context) => Contacts()));
           },
           child: ListTile
                  (
                   leading: Icon(Icons.pregnant_woman,color: Colors.grey,size: 25.0,),
                   title: new Text("Contact & Helpline", style: new TextStyle(color: Colors.grey,fontSize: 19.0)),
                  ),
           ),
         ],
       ),
     ),
      body: ListView
      (
        children: <Widget>
        [
          Padding(
           padding: const EdgeInsets.only(top:20.0),
           child: Center(
             child: Image.asset('resources/logo.jpg')
             ),
         ),
         Padding(
           padding: const EdgeInsets.only(top:10.0),
           child: Text("India Case Counts",textAlign: TextAlign.center,style: new TextStyle(color: Colors.grey,fontSize: 20.0,fontWeight: FontWeight.bold)),
         ),
         Padding(
           padding: const EdgeInsets.only(top:10.0),
           child: Summary()
         ),
        ],
      )
    );
  }
}


