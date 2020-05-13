import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var convertDataToJson,totalSamplesTested=0,totalIndividualsTested=0,totalPositiveCases=0;
List data,tests;

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  final String url = 'https://api.rootnet.in/covid19-in/stats/testing/latest';

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
      totalPositiveCases=data[0]['data']['totalPositiveCases'];
      totalSamplesTested=data[0]['data']['totalSamplesTested'];
      totalIndividualsTested=data[0]['data']['totalIndividualsTested'];
      //print(totalIndividualsTested);
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
       title: new Text("Test Reports",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
     ), 
     body: ListView
     (
       children: <Widget>
       [
         Container(
           height: 250.0,
           child: Card
           (
             child: Padding(
               padding: const EdgeInsets.only(left:20.0,right: 20.0),
               child: Column
               (
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>
                 [
                   SizedBox(height:30.0),
                   Text("Test Stats",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0)),
                   SizedBox(height:15.0),
                   Text("totalSamplesTested : $totalSamplesTested",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                   SizedBox(height:15.0),
                   Text("totalIndividualsTested : $totalIndividualsTested",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                   SizedBox(height:15.0),
                   Text("totalPositiveCases : $totalPositiveCases",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                 ],
               ),
             ),
           ),
         )
       ],
     ),
    );
  }
}