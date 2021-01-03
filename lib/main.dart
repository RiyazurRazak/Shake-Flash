import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
     var _isTurnOn = false; 

  @override
    void initState() {
    super.initState();
     ShakeDetector.autoStart(onPhoneShake: () {
           if(_isTurnOn){
                TorchCompat.turnOff();
                  setState(() {
                 _isTurnOn = false;
                 });
           }else{
             TorchCompat.turnOn();
                setState(() {
                _isTurnOn = true;
               });
           }
    });
  }

  _manualTorchOnHandller(){
    TorchCompat.turnOn();
    setState(() {
      _isTurnOn = true;
    });
  }
   _manualTorchOffHandller(){
     TorchCompat.turnOff();
      setState(() {
      _isTurnOn = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "Shake Flash",
       home: Scaffold(
         appBar: AppBar(
           title: Text("Shake Flash"),
           backgroundColor: Color(0xff121212),

         ),
         body: SafeArea(
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/bg.gif"),
                 fit: BoxFit.fill,
               ),
             ),
             child: Column(
               children: [
                 Expanded(
                    child: Center(
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         RaisedButton(
                           child: Text("Turn On",
                           style:TextStyle(
                             color: Color(0xff121212),
                             fontSize: 20,
                             fontWeight: FontWeight.w700
                           ) ,),
                           onPressed: _manualTorchOnHandller,
                           shape: RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(20),
                              ),
                           padding: EdgeInsets.all(20),  
                           color:   _isTurnOn ? Color(0xffffff00) : Color(0xffffffff),
                           ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              child: RaisedButton(
                           child: Text("Turn Off",
                           style:TextStyle(
                               color: Color(0xff121212),
                               fontSize: 20,
                               fontWeight: FontWeight.w600,
                           ) ,),
                           onPressed: _manualTorchOffHandller,
                           shape: RoundedRectangleBorder(
                               borderRadius:BorderRadius.circular(20),
                                ),
                           padding: EdgeInsets.all(20),   
                           ),
                            )
                       ],),
                    ),
                 ),
                   Expanded(
                     child: Column(
                       children:[
                         Text("Shake Your Phone To Turn Flash ON / OFF",
                         style: TextStyle(
                           color: Color(0xffffffff),
                           fontSize: 20,
                           ))
                       ]
                     )
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("By Riyazur Razak" , 
                        style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Color(0xff121212),
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),),
                      )
                     ],
                   )
               ],  
             ),
           ),
         ),
       ),
    );
  }
}