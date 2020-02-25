import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl/intl.dart';

class Pm25 extends StatefulWidget {
  @override
  _Pm25State createState() => _Pm25State();
  
}

class _Pm25State extends State<Pm25> {
 
  int random = Random().nextInt(400);
  int _counte = Random().nextInt(400);
  int _conute1 = Random().nextInt(400);
  int _conute2 = Random().nextInt(400);
  int _conute3 = Random().nextInt(400);
  int _conute4 = Random().nextInt(400);
  String _timeString;

  Widget box1(String time, int pm) {
    return Column(
      children: <Widget>[
        Text('$time', style: TextStyle(fontSize: 20)),
        Container(
          decoration: BoxDecoration(
              color: pm <= 50
                  ? Colors.green[300]
                  : pm <= 100
                      ? Colors.yellow[200]
                      : pm <= 150
                          ? Colors.orange[300]
                          : pm <= 200
                              ? Colors.red[300]
                              : pm <= 300
                                  ? Colors.purple[300]
                                  : 
                                       Colors.brown[500]
                                    ,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(right: 3),
          height: 30,
          width: 70,
          child: Center(
              child: Text(
            '$pm'.toString(),
          )),
        )
      ],
    );
  }

  bool box = false;
    void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('H:mm:ss').format(dateTime);
  }

@override
  void initState() {
   _timeString = _formatDateTime(DateTime.now());
   Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
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
        title: Text('PM2.5',style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FlareActor(
              "assets/splash.flr",
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              animation: "splash",
            ),
          ),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: AutoSizeText(
                            "TOT Phatthana ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 2,
                          )),
                        ),
                      ),
                    ],
                  ),
                  _counte <= 50
                      ? Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  box = !box;
                                });
                              },
                              child: Container(
                                  height: 200,
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
                                    color: Colors.green[300],
                                    border: Border.all(
                                        color: Colors.white, width: 7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                child: Image.asset(
                                                  'image/1.png',
                                                  color: Colors.white,
                                                )),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: AutoSizeText(
                                                '$_counte',
                                                style: TextStyle(
                                                    fontSize: 75,
                                                    color: Colors.green[500]),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: AutoSizeText(
                                                    'ดี',
                                                    style:
                                                        TextStyle(fontSize: 30),
                                                    maxLines: 2,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  "$_timeString",
                                  style: TextStyle(fontSize: 20),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 60, bottom: 10),
                                  child: Text(
                                    'คำแนะนำด้านสุขภาพ',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  "$_counte",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "$_counte",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "$_counte",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "$_counte",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        )
                      : _counte <= 100
                          ? Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      box = !box;
                                    });
                                  },
                                  child: Container(
                                      height: 200,
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
                                        color: Colors.yellow[200],
                                        border: Border.all(
                                            color: Colors.white, width: 7),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    child: Image.asset(
                                                      'image/2.png',
                                                      color: Colors.white,
                                                    )),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: AutoSizeText(
                                                    '$_counte',
                                                    style: TextStyle(
                                                        fontSize: 75,
                                                        color:
                                                            Colors.yellow[600]),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      child: AutoSizeText(
                                                        'ปานกลาง',
                                                        style: TextStyle(
                                                            fontSize: 30),
                                                        maxLines: 2,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Text(
                                      "$_timeString",
                                      style: TextStyle(fontSize: 20),
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                    box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                    box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                    box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 60, bottom: 10),
                                      child: Text(
                                        'คำแนะนำด้านสุขภาพ',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "$_counte",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "$_counte",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "$_counte",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "$_counte",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : _counte <= 150
                              ? Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          box = !box;
                                        });
                                      },
                                      child: Container(
                                          height: 200,
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
                                            color: Colors.orange[300],
                                            border: Border.all(
                                                color: Colors.white, width: 7),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Container(
                                            child: Row(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        child: Image.asset(
                                                          'image/3.png',
                                                          color: Colors.white,
                                                        )),
                                                    Center(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        child: AutoSizeText(
                                                          '$_counte',
                                                          style: TextStyle(
                                                              fontSize: 75,
                                                              color: Colors
                                                                  .orange[600]),
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          child: AutoSizeText(
                                                            'ไม่ดีต่อสุขภาพสำหรับกลุ่มที่อ่อนไหว',
                                                            style: TextStyle(
                                                                fontSize: 30),
                                                            maxLines: 2,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Text(
                                          "$_timeString",
                                          style: TextStyle(fontSize: 20),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                        box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                        box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                        box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          /*Container(
                                            decoration: BoxDecoration(
                                                color: Colors.orange[300],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            margin: EdgeInsets.only(right: 3),
                                            height: 30,
                                            width: 70,
                                            child: Center(
                                                child: Text(
                                              '$_counte'.toString(),
                                            )),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.orange[300],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            margin: EdgeInsets.only(right: 3),
                                            height: 30,
                                            width: 70,
                                            child: Center(
                                                child: Text(
                                              '$_counte'.toString(),
                                            )),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.orange[300],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            margin: EdgeInsets.only(right: 3),
                                            height: 30,
                                            width: 70,
                                            child: Center(
                                                child: Text(
                                              '$_counte'.toString(),
                                            )),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.orange[300],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            margin: EdgeInsets.only(right: 3),
                                            height: 30,
                                            width: 70,
                                            child: Center(
                                                child: Text(
                                              '$_counte'.toString(),
                                            )),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 60, bottom: 10),
                                          child: Text(
                                            'คำแนะนำด้านสุขภาพ',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "$_counte",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "$_counte",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "$_counte",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "$_counte",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : _counte <= 200
                                  ? Column(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              box = !box;
                                            });
                                          },
                                          child: Container(
                                              height: 200,
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
                                                color: Colors.red[300],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 7),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        Container(
                                                            height: MediaQuery
                                                                        .of(
                                                                            context)
                                                                    .size
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            child: Image.asset(
                                                              'image/4.png',
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          child: AutoSizeText(
                                                            '$_counte',
                                                            style: TextStyle(
                                                                fontSize: 75,
                                                                color: Colors
                                                                    .red[500]),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              child:
                                                                  AutoSizeText(
                                                                'ไม่ดีต่อสุขภาพ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30),
                                                                maxLines: 2,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            child: Text(
                                              "$_timeString",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                            box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                            box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                            box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 60, bottom: 10),
                                              child: Text(
                                                'คำแนะนำด้านสุขภาพ',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "$_counte",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              "$_counte",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              "$_counte",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              "$_counte",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : _counte <= 300
                                      ? Column(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  box = !box;
                                                });
                                              },
                                              child: Container(
                                                  height: 200,
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
                                                    color: Colors.purple[300],
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 7),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.3,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                child:
                                                                    Image.asset(
                                                                  'image/5.png',
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              child:
                                                                  AutoSizeText(
                                                                '$_counte',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        75,
                                                                    color: Colors
                                                                            .purple[
                                                                        600]),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Center(
                                                              child: Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.3,
                                                                  child:
                                                                      AutoSizeText(
                                                                    'ไม่ดีต่อสุขภาพมาก',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            30),
                                                                    maxLines: 2,
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 20, bottom: 20),
                                                child: Text(
                                                  "$_timeString",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                                box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                                box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                                box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 60, bottom: 10),
                                                  child: Text(
                                                    'คำแนะนำด้านสุขภาพ',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "$_counte",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  "$_counte",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  "$_counte",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  "$_counte",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : _counte <= 500
                                          ? Column(
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      box = !box;
                                                    });
                                                  },
                                                  child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black38,
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
                                                        color:
                                                            Colors.brown[500],
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 7),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      child: Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.3,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.3,
                                                                    child: Image
                                                                        .asset(
                                                                      'image/6.png',
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child:
                                                                      AutoSizeText(
                                                                    '$_counte',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            75,
                                                                        color: Colors
                                                                            .brown[800]),
                                                                    maxLines: 1,
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.3,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'เป็นอันตราย',
                                                                            style:
                                                                                TextStyle(fontSize: 30),
                                                                            maxLines:
                                                                                2,
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20, bottom: 20),
                                                    child: Text(
                                                      "$_timeString",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    )),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    box1('${(DateTime.now().hour-4).toString()}:00', _conute1),
                                                    box1('${(DateTime.now().hour-3).toString()}:00', _conute2),
                                                    box1('${(DateTime.now().hour-2).toString()}:00', _conute3),
                                                    box1('${(DateTime.now().hour-1).toString()}:00', _conute4),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 60, bottom: 10),
                                                      child: Text(
                                                        'คำแนะนำด้านสุขภาพ',
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "$_counte",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "$_counte",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "$_counte",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "$_counte",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : _counte,
                ],
              ),
            ],
          ),
          box
              ? Center(
                  child: Stack(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          color: Colors.grey.withOpacity(0.6),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('image/8.png')),
                      IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 40,
                          ),
                          onPressed: () {
                            setState(() {
                              box = !box;
                            });
                          }),
                    ],
                  ),
                )
              : Container(),
        ],
      )),
    );
  }
}
