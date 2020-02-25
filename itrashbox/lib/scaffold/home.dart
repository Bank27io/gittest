import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';


import 'package:itrashbox/model/name.dart';
import 'package:itrashbox/scaffold/admin.dart';
import 'package:itrashbox/scaffold/emeter.dart';
import 'package:itrashbox/scaffold/pm25.dart';
import 'package:itrashbox/scaffold/station.dart';
import 'package:itrashbox/scaffold/tool.dart';
import 'package:itrashbox/scaffold/wmeter.dart';

import 'battery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  final titles = ['โปรไฟล์', 'เพื่อน', 'ออกกำลังกาย'];
  final colors = [
    Colors.red,
    Colors.purple,
    Colors.cyan
  ];
  final String x;
  final icons = [
    CupertinoIcons.profile_circled,
    CupertinoIcons.group_solid,
    CupertinoIcons.home
  ];

  MyHomePage1({Key key, this.x}) : super(key: key);

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;
  bool box = false;
  bool number1 = false;
  bool number2 = false;
  bool number3 = false;
  bool number4 = false;
  int x = 2;
  Widget card(String text1) {
    return Card(
        child: InkWell(
      onTap: () {
        print('1');
         if (text1 == "ค่าไฟฟ้า") {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => Emeter()));
         } else if (text1 == "ถังขยะ") {
           Navigator.push(
        context, MaterialPageRoute(builder: (context) => Batterypage()));
    } else if (text1 == 'ค่าน้ำประปา') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wmeter()));
         }else if (text1 == 'admin') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Admin()));
         }
          else if (text1 == 'PM2.5') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pm25()));
         }
         else if (text1 == 'Station') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Station()));
         }
      },
      child: Container(
          height: 70,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.phone_iphone, color: Colors.blue[300], size: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "$text1",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              '40%',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            )),
                      ],
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Icon(Icons.subdirectory_arrow_right,
                        color: Colors.orange, size: 30))
              ],
            ),
          )),
    ));
  }

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  Widget profile() {
    return SafeArea(
      child: ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 40,bottom: 20),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://pngimage.net/wp-content/uploads/2018/06/%E0%B8%84%E0%B8%99-icon-png-8.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(width: 3, color: Colors.black)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "ชื่อ - นามสกุล",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3, color: Colors.blue[300]),
                              borderRadius: BorderRadius.circular(20.0)),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.27,
                          margin: EdgeInsets.only(top: 10),
                          child: RaisedButton(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.settings,
                                    size: MediaQuery.of(context).size.width *
                                        0.05,
                                    color: Colors.black,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: AutoSizeText(
                                        "ตั้งค่า",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      )),
                                               ],
                              ),
                              color: Colors.transparent,
                              elevation: 0,
                              onPressed: () {})),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: Colors.blue[300]),
                            borderRadius: BorderRadius.circular(20.0)),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: EdgeInsets.only(left: 5, top: 10),
                        child: RaisedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  size:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.black,
                                ),
                                Container(
                                    child: AutoSizeText(
                                  "แก้ไขข้อมูล",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                )),
                              ],
                            ),
                            color: Colors.transparent,
                            elevation: 0,
                            onPressed: () {}),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
          Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: Text(
                "อุปกรณ์ของฉัน",//testststst
                style: TextStyle(fontSize: 15, color: Colors.blue[900]),
              )),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: Name.list1.length,
                    itemBuilder: (BuildContext build, int index) {
                      return card(Name.list1[index].name);
                    }),
              ),
              Card(
                  child: InkWell(
                onTap: () {
                  print('object');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Tool()));
                },
                child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.red, size: 30),
                        Text(
                          "เพิ่มอุปกรณ์ของฉัน ",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    )),
              )),
            ],
          ),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: Text(
                "เพิ่มเติม",
                style: TextStyle(fontSize: 15, color: Colors.blue[900]),
              )),
              Card(
                  child: InkWell(
                onTap: () {
                  print('5');
                },
                child: Container(
                    height: 50,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.supervisor_account,
                                  color: Colors.blue[300], size: 30),
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "เพื่อน",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900]),
                                  )),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 100),
                              child: Icon(Icons.subdirectory_arrow_right,
                                  color: Colors.orange, size: 30))
                        ],
                      ),
                    )),
              )),
              Card(
                  child: InkWell(
                onTap: () {
                  print('6');
                },
                child: Container(
                    height: 50,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: Colors.blue[300], size: 30),
                              Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "ตั้งเป้าหมาย",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900]),
                                  )),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 100),
                              child: Icon(Icons.subdirectory_arrow_right,
                                  color: Colors.orange, size: 30))
                        ],
                      ),
                    )),
              )),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tap = [
      profile(),
      Container(),
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    InkWell(
                      onTap: () {
                        setState(() {
                          box = !box;
                          x= 1;
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius:
                                      10.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      2.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    1.0, // horizontal, move right 10
                                    1.0, // vertical, move down 10
                                  ),
                                )
                              ],
                              color:number1? Colors.grey:Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset('image/ลู่วิ่ง.png')),
                    ),
                    InkWell(
                      onTap: () {
                       setState(() {
                          box = !box;
                          x= 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    2.0, // has the effect of extending the shadow
                                offset: Offset(
                                  1.0, // horizontal, move right 10
                                  1.0, // vertical, move down 10
                                ),
                              )
                            ],
                            color:number2? Colors.grey:Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset('image/ซิทอัพ.png'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    InkWell(
                      onTap: () {
                        setState(() {
                          box = !box;
                          x= 3;
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius:
                                      10.0, // has the effect of softening the shadow
                                  spreadRadius:
                                      2.0, // has the effect of extending the shadow
                                  offset: Offset(
                                    1.0, // horizontal, move right 10
                                    1.0, // vertical, move down 10
                                  ),
                                )
                              ],
                              color:number3? Colors.grey:Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset('image/จักรยาน.png')),
                    ),
                    InkWell(
                      onTap: () {
                       setState(() {
                          box = !box;
                          x= 4;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    2.0, // has the effect of extending the shadow
                                offset: Offset(
                                  1.0, // horizontal, move right 10
                                  1.0, // vertical, move down 10
                                ),
                              )
                            ],
                            color:number4? Colors.grey:Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset('image/ที่ยกน้ำหนัก.png'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          box
              ? Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.grey.withOpacity(0.5),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      box = !box;
                                    if(x ==1){
                                        number1 = true;
                                    }else     if(x ==2){
                                        number2 = true;
                                    }else     if(x ==3){
                                        number3 = true;
                                    }else     if(x ==4){
                                        number4 = true;
                                    }


                                      
                                    });
                                  },
                                  color: Colors.green,
                                  child: Text(
                                    'Accept',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () => {
                                    setState(() {
                                      box = !box;
                                    })
                                  },
                                  color: Colors.red,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            //color: Colors.white,
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    ];
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.white,
        ),*/
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children: tap,
            onPageChanged: (page) {},
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Colors.white,
          defaultBubbleColor: Colors.blue,
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.easeInOutQuad,
                duration: Duration(milliseconds: 500));
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              bubbleColor: color,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }
}