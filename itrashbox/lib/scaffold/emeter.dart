import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Emeter extends StatefulWidget {
  @override
  _EmeterState createState() => _EmeterState();
}

class _EmeterState extends State<Emeter> {
  bool detail = false;
  bool isShowingMainData = false;
  bool show = false;
  bool search = false;
  double x, y = 0;
  List<FlSpot> chart1 = [
    FlSpot(1, 1500),
    FlSpot(2, 4000),
    FlSpot(3, 1500),
    FlSpot(4, 3000),
    FlSpot(5, 1500),
    FlSpot(6, 4500),
    FlSpot(7, 3500),
    FlSpot(8, 5000),
    FlSpot(9, 1000),
    FlSpot(10, 3000),
    FlSpot(11, 500),
    FlSpot(12, 2000),
  ];
  List<FlSpot> chart2 = [
    FlSpot(1, 500),
    FlSpot(2, 400),
    FlSpot(3, 200),
    FlSpot(4, 350),
    FlSpot(5, 100),
    FlSpot(6, 400),
    FlSpot(7, 200),
    FlSpot(8, 500),
    FlSpot(9, 100),
    FlSpot(10, 300),
    FlSpot(11, 400),
    FlSpot(12, 250),
  ];

  Widget buttonMonth(String text) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 40,
      width: 65,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.blue[100]),
          borderRadius: BorderRadius.circular(5.0)),
      child: RaisedButton(
          child: AutoSizeText(
            "$text",
            style: TextStyle(fontSize: 17, color: Colors.blue),
          ),
          color: Colors.transparent,
          elevation: 0,
          onPressed: () {
            setState(() {
              isShowingMainData = !isShowingMainData;
            });
          }),
    );
  }

  Widget price(String text1, double text2, double text3) {
    FlutterMoneyFormatter fmfB = FlutterMoneyFormatter(amount: text2);
    MoneyFormatterOutput fob = fmfB.output;
    FlutterMoneyFormatter fmfC = FlutterMoneyFormatter(amount: text3);
    MoneyFormatterOutput foc = fmfC.output;
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$text1',
                style: TextStyle(fontSize: 10),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    fob.nonSymbol,
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    foc.nonSymbol,
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget total(double text2, double text3) {
    FlutterMoneyFormatter fmfB = FlutterMoneyFormatter(amount: x);
    MoneyFormatterOutput fob = fmfB.output;
    FlutterMoneyFormatter fmfC = FlutterMoneyFormatter(amount: y);
    MoneyFormatterOutput foc = fmfC.output;
    return Expanded(
        flex: 2,
        child: Container(
          //height: 100,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "รวมค่าไฟฟ้าทั้งหมด",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      fob.nonSymbol,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      foc.nonSymbol,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  LineChartData sampleData1price() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: true,
      ),
      gridData: const FlGridData(
        horizontalInterval: 1000,
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Jan';
              case 2:
                return 'Feb';
              case 3:
                return 'Mar';
              case 4:
                return 'Api';
              case 5:
                return 'May';
              case 6:
                return 'Jun';
              case 7:
                return 'Jul';
              case 8:
                return 'Aug';
              case 9:
                return 'Sep';
              case 10:
                return 'Oct';
              case 11:
                return 'Sep';
              case 12:
                return 'Dec';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1000:
                return '1000';
              case 2000:
                return '2000';
              case 3000:
                return '3000';
              case 4000:
                return '4000';
              case 5000:
                return '5000';
            }
            return '';
          },
          margin: 15,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Colors.red[100],
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 5000,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    return [
      LineChartBarData(
        spots: chart1,
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          Colors.red[100],
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          dotColor: Colors.red,
          show: true,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }

  LineChartData sampleData2unit() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: true,
      ),
      gridData: const FlGridData(
        horizontalInterval: 100,
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Jan';
              case 2:
                return 'Feb';
              case 3:
                return 'Mar';
              case 4:
                return 'Api';
              case 5:
                return 'May';
              case 6:
                return 'Jun';
              case 7:
                return 'Jul';
              case 8:
                return 'Aug';
              case 9:
                return 'Sep';
              case 10:
                return 'Oct';
              case 11:
                return 'Sep';
              case 12:
                return 'Dec';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 100:
                return '100';
              case 200:
                return '200';
              case 300:
                return '300';
              case 400:
                return '400';
              case 500:
                return '500';
            }
            return '';
          },
          margin: 15,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Colors.blue[100],
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 500,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      LineChartBarData(
        spots: chart2,
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }

  Widget detailfunc() {
    return Container(
      height: 50,
      width: 50,
      color: Colors.blue[100].withOpacity(0.9),
      child: Column(
        children: <Widget>[
          Text("รายละเอียดของอุปกรณ์"),
          Text("Serial number"),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(MediaQuery.of(context).size.width<1280){
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left:12),
        child: IconButton(icon: Icon(Icons.arrow_back,color:Colors.black87),
        onPressed: (){
          setState(() {
            Navigator.pop(context);
          });
        },),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'NAME DEVICE',
          style: TextStyle(color: Colors.blue[200]),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.blue[200],
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 35, top: 30),
                            width: MediaQuery.of(context).size.width * 0.30,
                            height: MediaQuery.of(context).size.width * 0.30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://pngimage.net/wp-content/uploads/2018/06/%E0%B8%84%E0%B8%99-icon-png-8.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                border:
                                    Border.all(width: 3, color: Colors.white)),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10, top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.battery_charging_full,
                                          color: Colors.white, size: 40),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "แบตเตอรี่ : 47 %",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.bubble_chart,
                                          color: Colors.white, size: 40),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "สถานะ : กำลังใช้งาน",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ])),
                Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.bubble_chart,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                detail = !detail;
                              });
                            }),
                      ],
                    )),
              ],
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0x22262c),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: RaisedButton(
                                  child: Text("ค้นหา"),
                                  color: Colors.blue[100],
                                  onPressed: () {
                                    setState(() {
                                      search = !search;
                                    });
                                  })),
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.money_off,
                                          size: 40, color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          isShowingMainData = true;
                                        });
                                      }),
                                  Text("ค่าไฟฟ้า ",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.close,
                                          size: 40, color: Colors.blue),
                                      onPressed: () {
                                        setState(() {
                                          isShowingMainData = false;
                                        });
                                      }),
                                  Text("จำนวนยูนิต ",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: LineChart(
                        isShowingMainData
                            ? sampleData1price()
                            : sampleData2unit(),
                        swapAnimationDuration: Duration(milliseconds: 250),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                buttonMonth('ม.ค'),
                                buttonMonth('ก.พ'),
                                buttonMonth('มี.ค'),
                                buttonMonth('เม.ย'),
                                buttonMonth('พ.ค'),
                                buttonMonth('มิ.ย'),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                buttonMonth('ก.ค'),
                                buttonMonth('ส.ค'),
                                buttonMonth('ก.ย'),
                                buttonMonth('ต.ค'),
                                buttonMonth('พ.ย'),
                                buttonMonth('ธ.ค'),
                              ]),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                              color: Colors.blue[100],
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Center(
                                    child: Text("แสดงค่าไฟฟ้าในแต่ละเดือน",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))),
                                height: 40,
                                width: 200,
                              ),
                              onPressed: () {
                                setState(() {
                                  show = !show;
                                });
                              })
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.52,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    child: Card(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              'เดือน',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                'ค่าไฟฟ้า',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                'จำนวนยูนิต',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  price("มกราคม", 10000.00, 11120.00),
                                  price("กุมภาพันธ์", 10.00, 20.00),
                                  price("มีนาคม", 10.00, 20.00),
                                  price("เมษายน", 10.00, 20.00),
                                  price("พฤษภาคม", 10.00, 20.00),
                                  price("มิถุนายน", 10.00, 20.00),
                                  price("กรกฎาคม", 10.00, 20.00),
                                  price("สิงหาคม", 10.00, 20.00),
                                  price("กันยายน", 10.00, 20.00),
                                  price("ตุลาคม", 10.00, 20.00),
                                  price("พฤศจิกายน", 10.00, 20.00),
                                  price("ธันวาคม", 10.00, 20.00),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          1.0,
                                          1.0,
                                        ),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "ค่าไฟฟ้าปัจจุบัน",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "1800.00",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "บาท",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          1.0,
                                          1.0,
                                        ),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "จำนวนยูนิต",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "543.00",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "ยูนิต",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /* show
                        ? 
                        : Container(), */
                  ],
                ),
              ),
            )
          ]),
          detail
              ? Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        //color: Colors.blue,
                        height: 400,
                        width: 270,
                        child: detailfunc(),
                      ),
                    ],
                  ),
                )
              : Container(),
          search
              ? Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 240,
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "เลือกวันที่",
                                style: TextStyle(color: Colors.white),
                              ),
                              RaisedButton(onPressed: () {
                                setState(() {
                                  search = !search;
                                });
                              }),
                              RaisedButton(onPressed: () {
                                setState(() {
                                  search = !search;
                                });
                              }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RaisedButton(
                                      child: Text("ค้นหา"),
                                      onPressed: () {
                                        setState(() {
                                          search = !search;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
