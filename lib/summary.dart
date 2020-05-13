import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var convertDataToJson,total=0,cci=0,ccf=0,dis=0,deaths=0;


class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

 final String url = 'https://api.rootnet.in/covid19-in/stats/latest';
  List data;

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
      //print(data[0]['data']['summary']['total']);
      total=data[0]['data']['summary']['total'];
      cci=data[0]['data']['summary']['confirmedCasesIndian'];
      ccf=data[0]['data']['summary']['confirmedCasesForeign'];
      dis=data[0]['data']['summary']['discharged'];
      deaths=data[0]['data']['summary']['deaths'];

      return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }



  @override
  Widget build(BuildContext context) {
         return Container
                       (
                       height: 350.0,
                         child: Padding
                         (
                           padding: const EdgeInsets.all(20.0),
                           child: Card
                           (
                             child: Column
                             (
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>
                               [
                                 Padding(
                                   padding: const EdgeInsets.only(left:25.0,right: 25.0,top:30.0),
                                   child: ListTile
                                   (
                                     title: Text('Summary',textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize:19.0),),
                                     subtitle: Padding(
                                       padding: const EdgeInsets.only(top:40.0),
                                       child: Column
                                       (
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>
                                         [
                                           Text("Total : $total",textAlign: TextAlign.left,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
                                           Text("confirmedCasesIndian : $cci",textAlign: TextAlign.left,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
                                           Text("confirmedCasesForeign : $ccf",textAlign: TextAlign.left,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
                                           Text("discharged : $dis",textAlign: TextAlign.left,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
                                           Text("deaths : $deaths",textAlign: TextAlign.left,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),)
                                         ],
                                       ),
                                     )
                                   ),
                                 ),
                               ],
                               ),
                           ),
                         ),
        );
       }
}