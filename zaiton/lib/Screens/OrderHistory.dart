import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List list = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: height / 3.6,
                    width: width,
                    child: Image.asset(
                      'assets/img3.jpg',
                      fit: BoxFit.cover,
                    )),
                Container(
                  height: height / 3.6,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        ZThemes.appTheme,
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0)
                      ])),
                ),
                Container(
                  height: height / 3.6,
                  width: width,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: height / 30, left: width / 10),
                      child: Text(
                        'Order History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 16,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Outlet info',
                    style: TextStyle(color: ZThemes.darkTheme, fontSize: 13),
                  ),
                  Text(
                    'Order',
                    style: TextStyle(color: ZThemes.darkTheme, fontSize: 13),
                  ),
                  Text(
                    'Return  ',
                    style: TextStyle(color: ZThemes.darkTheme, fontSize: 13),
                  ),
                ],
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black12,
                    offset: Offset(-1, -1)),
                BoxShadow(
                    blurRadius: 4, color: Colors.black12, offset: Offset(2, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(left: width / 20, right: width / 20),
            ),
            Expanded(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) {
                return Container(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20,bottom:height/40 ),
                  child: Column(
                    children: [
                      Container(
                        height: height / 6.5,
                        width: width,
                        padding: EdgeInsets.only(
                            right: width / 20,
                            left: width / 20,
                            ),
                        child: Column(
                          children: [
                            Text(
                              'Osman General Store',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ZThemes.darkTheme),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Text(
                              'Street no-10 F10, Islamabad',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: ZThemes.darkTheme),
                            ),
                            SizedBox(
                              height: height / 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height / 25,
                                  width: width / 3.6,
                                  child: Center(
                                    child: Text(
                                      'View order',
                                      style: TextStyle(
                                          color: ZThemes.appTheme,
                                          fontSize: 12,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: ZThemes.appTheme, width: 1)),
                                ),
                                Text(
                                  'Outlet info',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black12,
                                  offset: Offset(1, 3))
                            ],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                );
              },
              itemCount: list.length,
            )),
            SizedBox(
              height: height / 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: width / 20),
                height: height / 20,
                width: width / 3.5,
                child: Center(
                  child: Text(
                    'Order',
                    style: TextStyle(
                        color: Colors.white, fontSize: 14, letterSpacing: 2),
                  ),
                ),
                decoration: BoxDecoration(
                    color: ZThemes.appTheme,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
