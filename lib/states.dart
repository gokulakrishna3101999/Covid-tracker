import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

var convertDataToJson,len=0;
List data,states;

class StateReport extends StatefulWidget {
  @override
  _StateReportState createState() => _StateReportState();
}

class _StateReportState extends State<StateReport> {

  final String url = 'https://api.rootnet.in/covid19-in/stats/latest';

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
      states=[data[0]['data']['regional']];
      len=states[0].length;
      print(len);
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
        title: new Text("State Report",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
      body: new ListView.builder
      (
        itemCount: len,
        itemBuilder: (BuildContext context,int index)
        {
          return Container
          (
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
                     SizedBox(height:20.0),
                     Text("${states[0][index]['loc'].toString()}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                     SizedBox(height:40.0),
                     Text("confirmedCasesIndian : ${states[0][index]['confirmedCasesIndian'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                     Text("confirmedCasesForeign : ${states[0][index]['confirmedCasesForeign'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                     Text("discharged : ${states[0][index]['discharged'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                     Text("deaths : ${states[0][index]['deaths'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0)),
                     Text("totalConfirmed : ${states[0][index]['totalConfirmed'].toString()}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15.0))
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