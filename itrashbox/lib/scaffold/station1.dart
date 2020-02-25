import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Station1 extends StatefulWidget {
  final String title;
  final Color color;
  

  const Station1( {Key key, this.title, this.color}) : super(key: key);
  @override
  _Station1State createState() => _Station1State();
}

class _Station1State extends State<Station1> {
  @override
  int x = 0;
  bool number1 = false;
  bool number2 = false;
  bool number3 = false;
  bool number4 = false;
  bool number5 = false;
  bool number6 = false;
  bool number7 = false;
  bool number8 = false;
  bool number9 = false;
  bool number10 = false;
  bool number11 = false;
  bool number12 = false;

  Widget card(String text1, int number) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            box = !box;
            x = number;
          });
        },
        child: Container(
          
            //margin: EdgeInsets.only(top: 5),
            color: number == 1
                ? number1 ? Colors.grey : widget.color
                : number == 2
                    ? number2 ? Colors.grey : widget.color
                    : number == 3
                        ? number3 ? Colors.grey : widget.color
                        : number == 4
                            ? number4 ? Colors.grey : widget.color
                            : number == 5
                                ? number5 ? Colors.grey : widget.color
                                : number == 6
                                    ? number6 ? Colors.grey : widget.color
                                    : number == 7
                                        ? number7
                                            ? Colors.grey
                                            : widget.color
                                        : number == 8
                                            ? number8
                                                ? Colors.grey
                                                : widget.color
                                            : number == 9
                                                ? number9
                                                    ? Colors.grey
                                                    : widget.color
                                                : number == 10
                                                    ? number10
                                                        ? Colors.grey
                                                        : widget.color
                                                    : number == 11
                                                        ? number11
                                                            ? Colors.grey
                                                            : widget.color
                                                        : number == 12
                                                            ? number12
                                                                ? Colors.grey
                                                                : widget.color
                                                            : widget.color,
            // border: Border.all(color: widget.color, width: 2),
            height: 50,
            // color: Colors.blue,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "$text1",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  bool box = false;

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
        title: Text('${widget.title}',style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
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
                    color: widget.color,
                    border: Border.all(color: Colors.white, width: 7),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Image.asset('image/แท่นชาร์จ.png')),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('DC Hing Power'),
                            Text('150 to 350kW+'),
                            Text('10-20 min'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'เวลา',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 320,
                  child: ListView(
                    children: <Widget>[
                      card('00.00-00.30', 1),
                      card('00.30-01.00', 2),
                      card('01.00-01.30', 3),
                      card('01.30-02.00', 4),
                      card('02.00-02.30', 5),
                      card('02.30-03.00', 6),
                      card('03.00-03.30', 7),
                      card('03-30-04.00', 8),
                      card('04.00-04.30', 9),
                      card('04.30-05.00', 10),
                      card('05.00-05.30', 11),
                      card('05.30-06.00', 12),
                      // card('06.00-06.30'),
                      // card('06.30-07.00'),
                      // card('07.00-07.30'),
                      // card('07.30-08.00'),
                      // card('08.00-08.30'),
                      // card('08.30-09.00'),
                      // card('09.00-09.30'),
                      // card('09.30-10.00'),
                      // card('10.00-10.30'),
                      // card('10.30-11.00'),
                      // card('11.00-11.30'),
                      // card('11.30-12.00'),
                      // card('12.00-12.30'),
                      // card('12.30-13.00'),
                      // card('13.00-13.30'),
                      // card('13.30-14.00'),
                      // card('14.00-14.30'),
                      // card('14.30-15.00'),
                      // card('15.00-15.30'),
                      // card('15.30-16.00'),
                      // card('16.00-16.30'),
                      // card('16.30-17.00'),
                      // card('17.00-17.30'),
                      // card('17.30-18.00'),
                      // card('18.00-18.30'),
                      // card('18.30-19.00'),
                      // card('19.00-19.30'),
                      // card('19.30-20.00'),
                      // card('20.00-20.30'),
                      // card('20.30-21.00'),
                      // card('21.00-21.30'),
                      // card('21.30-22.00'),
                      // card('22.00-22.30'),
                      // card('22.30-23.00'),
                      // card('23.00-23.30'),
                      // card('23.30-00.00'),
                    ],
                  ),
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
                        ),
                        /*IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {
                                box = !box;
                              });
                            }),*/
                        Center(
                          child: Container(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      box = !box;
                                      if (x == 1) {
                                        number1 = true;
                                      } else if (x == 2) {
                                        number2 = true;
                                      } else if (x == 3) {
                                        number3 = true;
                                      } else if (x == 4) {
                                        number4 = true;
                                      } else if (x == 5) {
                                        number5 = true;
                                      } else if (x == 6) {
                                        number6 = true;
                                      } else if (x == 7) {
                                        number7 = true;
                                      } else if (x == 8) {
                                        number8 = true;
                                      } else if (x == 9) {
                                        number9 = true;
                                      } else if (x == 10) {
                                        number10 = true;
                                      } else if (x == 11) {
                                        number11 = true;
                                      } else if (x == 12) {
                                        number12 = true;
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
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
