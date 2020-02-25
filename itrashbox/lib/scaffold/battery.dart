import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
import 'package:custom_switch/custom_switch.dart';

class Batterypage extends StatefulWidget {
  Batterypage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BatterypageState createState() => _BatterypageState();
}

class _BatterypageState extends State<Batterypage> {
  int random = Random().nextInt(100);
  int _counter = Random().nextInt(100);
  var battery = Battery();
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(battery.batteryLevel);

// Be informed when the state (full, charging, discharging) changes
    battery.onBatteryStateChanged.listen((BatteryState state) {
      // Do something with new state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
                padding: EdgeInsets.only(left: 12),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),
              ),
        backgroundColor: Colors.white,
        title: Text('Mi Smart Band 4',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [Colors.white, Colors.blue[300]])),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black38,
                     blurRadius: 20.0, // has the effect of softening the shadow
                     spreadRadius: 5.0, // has the effect of extending the shadow
                     offset: Offset(
                       5.0, // horizontal, move right 10
                       5.0, // vertical, move down 10
                     ),
                   )
                 ],
                color: Colors.white,
                border: Border.all(color: Colors.white),
                 borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    
                        color: Colors.white,
                        // border: Border.all(color: Colors.white),
                        // borderRadius: BorderRadius.all(Radius.circular(100)),
                       // shape: BoxShape.circle,
                        //image: DecorationImage(
                          child: _counter <= 30
                                  ? Image.asset('image/battery (2).png')
                                  : _counter <= 70
                                      ? Image.asset('image/battery (1).png')
                                      : Image.asset('image/battery.png'),
                         // fit: BoxFit.fill,
                        //),
                        //border:
                          //  Border.all(width: 3, color: Colors.transparent)),
                    /*   child: Stack(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        /*Container(
                          child: Text(
                            '',
                            style: TextStyle(fontSize: 20),
                          ),
                          //height: 50,
                          margin: EdgeInsets.only(top: 10),
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              //width: MediaQuery.of(context).size.width*0.3,
                              child: _counter <= 20
                                  ? Image.asset('image/battery (2).png')
                                  : _counter <= 50
                                      ? Image.asset('image/battery (1).png')
                                      : Image.asset('image/battery.png'),
                            ),
                           // Text(_counter.toString() + "%"),
                          ],
                        ),
                      ],
                    ),
            */
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        _counter.toString() + "%",
                        style: TextStyle(fontSize: 30),
                      )),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: 500,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.blue[200],
                      border: Border.all(color: Colors.blue[200]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 60,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Center(
                                child: Icon(
                              Icons.power_settings_new,
                              size: 40,
                            )),
                            Text('สถานะ'),
                          ],
                        ),
                        CustomSwitch(
                          activeColor: Colors.pinkAccent,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.blue[200],
                      border: Border.all(color: Colors.blue[200]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 40,
                            ),
                            Text('โทร')
                          ],
                        ),
                        CustomSwitch(
                          activeColor: Colors.pinkAccent,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.blue[200],
                      border: Border.all(color: Colors.blue[200]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              size: 40,
                            ),
                            Text('ราคาวันนี้')
                          ],
                        ),
                        CustomSwitch(
                          activeColor: Colors.pinkAccent,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.blue[200],
                      border: Border.all(color: Colors.blue[200]),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.delete_outline,
                              size: 40,
                            ),
                            Text('น้ำหนักขนะ'),
                          ],
                        ),
                        CustomSwitch(
                          activeColor: Colors.pinkAccent,
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
