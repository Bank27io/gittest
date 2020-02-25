import 'package:flutter/material.dart';
import 'package:itrashbox/scaffold/emeter.dart';
import 'package:itrashbox/scaffold/station.dart';
import 'package:itrashbox/scaffold/station1.dart';
import 'package:itrashbox/scaffold/wmeter.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

bool emeterall = false;
bool wmeterall = false;
bool fitnessall = false;
bool chargerall = false;

class _AdminState extends State<Admin> {
  @override
  void initState() {
    // TODO: implement initState
    emeterall = false;
    wmeterall = false;
    fitnessall = false;
    chargerall = false;
  }

  Widget water() {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset("image/water.png")),
          onTap: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wmeter()));
            });
          },
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Name",
              style: TextStyle(fontSize: 17, color: Colors.white),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Price",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ))
      ],
    );
  }

  Widget elect() {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset("image/elect.png")),
          onTap: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Emeter()));
            });
          },
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Name",
              style: TextStyle(fontSize: 17, color: Colors.white),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Price",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ))
      ],
    );
  }

  Widget fitness() {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset("image/fitness1.png")),
          onTap: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Emeter()));
            });
          },
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Name",
              style: TextStyle(fontSize: 17, color: Colors.white),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "ว่าง/ไม่ว่าง",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ))
      ],
    );
  }

  Widget charger(String text1, Color c) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset("image/charg.png")),
          onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Station1(
                            title: '$text1',
                            color: c,
                          )));
            });
          },
        ),
        Container(
            margin: EdgeInsets.all(5),
            child: Text(
              "$text1",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "ว่าง/ไม่ว่าง",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Admin Desk',
          style: TextStyle(color: Colors.blue[200]),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            InkWell(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: Image.asset("image/wmeter.png")),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Water Meter",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.blue),
                                      ))
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  wmeterall = !wmeterall;
                                });
                              },
                            ),
                            InkWell(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: Image.asset("image/fitness.png")),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Excercise Machine",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.yellow[700]),
                                      ))
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  fitnessall = !fitnessall;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            InkWell(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: Image.asset("image/emeter.png")),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Electricity Meter",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.red),
                                      ))
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  emeterall = !emeterall;
                                });
                              },
                            ),
                            InkWell(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      child: Image.asset("image/charger.png")),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Car Charger ",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.green),
                                      ))
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  chargerall = !chargerall;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  emeterall
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          color: Colors.black87,
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: IconButton(
                                                  icon: Icon(Icons.close,
                                                      size: 40,
                                                      color: Colors.white),
                                                  onPressed: () {
                                                    setState(() {
                                                      emeterall = !emeterall;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "ELECTRICITY METER",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    elect(),
                                    elect(),
                                    elect(),
                                    elect(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    elect(),
                                    elect(),
                                    elect(),
                                    elect(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    elect(),
                                    elect(),
                                    elect(),
                                    elect(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    elect(),
                                    elect(),
                                    elect(),
                                    elect(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    elect(),
                                    elect(),
                                    elect(),
                                    elect(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  wmeterall
                      ? Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              //height: MediaQuery.of(context).size.height,
                              color: Colors.black87,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Stack(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: IconButton(
                                                      icon: Icon(Icons.close,
                                                          size: 40,
                                                          color: Colors.white),
                                                      onPressed: () {
                                                        setState(() {
                                                          wmeterall =
                                                              !wmeterall;
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "WATER METER",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        water(),
                                        water(),
                                        water(),
                                        water(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  fitnessall
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          color: Colors.black87,
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: IconButton(
                                                  icon: Icon(Icons.close,
                                                      size: 40,
                                                      color: Colors.white),
                                                  onPressed: () {
                                                    setState(() {
                                                      fitnessall = !fitnessall;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "EXCERCISE MACHINE",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                    fitness(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  chargerall
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          color: Colors.black87,
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Stack(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: IconButton(
                                                  icon: Icon(Icons.close,
                                                      size: 40,
                                                      color: Colors.white),
                                                  onPressed: () {
                                                    setState(() {
                                                      chargerall = !chargerall;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "CAR CHARGER",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    charger("แท่นชาร์จ 1", Colors.red[300]),
                                    charger("แท่นชาร์จ 2", Colors.blue[300]),
                                    charger("แท่นชาร์จ 3", Colors.yellow[600]),
                                    charger("แท่นชาร์จ 4", Colors.green[300]),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    charger("แท่นชาร์จ 1", Colors.red[300]),
                                    charger("แท่นชาร์จ 2", Colors.blue[300]),
                                    charger("แท่นชาร์จ 3", Colors.yellow[600]),
                                    charger("แท่นชาร์จ 4", Colors.green[300]),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    charger("แท่นชาร์จ 1", Colors.red[300]),
                                    charger("แท่นชาร์จ 2", Colors.blue[300]),
                                    charger("แท่นชาร์จ 3", Colors.yellow[600]),
                                    charger("แท่นชาร์จ 4", Colors.green[300]),
                                  ],
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      charger("แท่นชาร์จ 1", Colors.red[300]),
                                      charger("แท่นชาร์จ 2", Colors.blue[300]),
                                      charger(
                                          "แท่นชาร์จ 3", Colors.yellow[600]),
                                      charger("แท่นชาร์จ 4", Colors.green[300]),
                                    ]),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    charger("แท่นชาร์จ 1", Colors.red[300]),
                                    charger("แท่นชาร์จ 2", Colors.blue[300]),
                                    charger("แท่นชาร์จ 3", Colors.yellow[600]),
                                    charger("แท่นชาร์จ 4", Colors.green[300]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
