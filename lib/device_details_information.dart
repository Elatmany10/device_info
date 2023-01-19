import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DDI extends StatefulWidget {
  @override
  State<DDI> createState() => _DDIState();
}
class _DDIState extends State<DDI> {
  var systemName, name, modle, id, deviceVerion, brand, display, host, realDevice, finger, type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information System"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        deviceDetails();
      },
        child: Icon(Icons.info),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
              child: ListTile(
                subtitle: Text("${modle}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Modle :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${id}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Id :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${display}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Display :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${deviceVerion}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Device Version :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${realDevice}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Real Device :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${finger}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Finger :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${type}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Type :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${brand}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Brand :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
            Card(
              child: ListTile(
                subtitle: Text("${host}",style: TextStyle(fontSize: 25,color: Colors.blue)),
                title: Text("Host :- ",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future deviceDetails() async{
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try{
      if(Platform.isAndroid){
        var android = await deviceInfoPlugin.androidInfo;
        setState((){
          modle = android.model;
          id = android.id;
          deviceVerion = android.version.sdkInt;
          brand = android.brand;
          display = android.display;
          host = android.host;
          realDevice = android.isPhysicalDevice;
          finger = android.fingerprint;
          type = android.type;
        });
      }else if(Platform.isIOS){
        var ios =await deviceInfoPlugin.iosInfo;
        name = ios.name;
        systemName = ios.systemName;
        modle = ios.model;
        deviceVerion = ios.systemVersion;
        realDevice = ios.isPhysicalDevice;
      }
    }on PlatformException{
      print("error");
    }
  }

}
