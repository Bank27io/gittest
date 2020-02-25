import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:itrashbox/model/bin.dart';
import 'package:itrashbox/model/name.dart';

import 'package:search_widget/search_widget.dart';

class Tool extends StatefulWidget {
  @override
  _ToolState createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('เลือกอุปกรณ์'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'ถังขยะ'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'ถังขยะ',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'admin'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'admin',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'ค่าไฟฟ้า'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'ค่าไฟฟ้า',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'ค่าน้ำประปา'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'ค่าน้ำประปา',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'PM2.5'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'PM2.5',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Name.list1.add(new Bin(name: 'Station'));
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
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
                        color: Colors.blue[100],
                        border: Border.all(color: Colors.blue[100]),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 100,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Station',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('5');
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
