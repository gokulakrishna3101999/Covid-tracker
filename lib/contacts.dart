import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var convertDataToJson,len=0;
List data,states;


class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

 final String url = 'https://api.rootnet.in/covid19-in/contacts';

  Future<String> getJsonData() async
  {
      var response = await http.get
      (
        Uri.encodeFull(url), 
      );
     // print(response.body);

      setState(() {
        convertDataToJson = json.decode(response.body);
      });

      data=[convertDataToJson];
      states=[data[0]['data']['contacts']['regional']];
      len=states[0].length;
      return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
     appBar: new AppBar
     (
       elevation: 0.5,
       centerTitle: true,
       title: new Text("HelpLine",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
     ),    
     body: new ListView.builder
      (
        itemCount: len,
        itemBuilder: (BuildContext context,int index)
        {
          return Container
          (
            height: 150.0,
            child: Card
            (
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>
                  [
                     SizedBox(height:20.0),
                     Text("${states[0][index]['loc'].toString()}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                     SizedBox(height:40.0),
                     Text("contact : ${states[0][index]['number'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                  ], 
                ),
              ),
            ),
          );
        },
      ),   
    );
  }
}