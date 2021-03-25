import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';

class Returns extends StatefulWidget {
  Returns({Key key}) : super(key: key);

  @override
  _ReturnsState createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
  List list = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13'
  ];
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
            Container(
              height: height / 3.5,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: height / 30, left: width / 10),
                      child: Text(
                        'Returns',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              width: width,
              decoration: BoxDecoration(color: ZThemes.appTheme),
            ),
            SizedBox(
              height: height / 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: height / 22,
                width: width / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width / 50,
                    ),
                    Text(
                      'Return',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                margin: EdgeInsets.only(right: width / 30),
                decoration: BoxDecoration(
                    color: ZThemes.appTheme,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Expanded(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) {
                return Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 50,
                      ),
                      Container(
                        height: height / 6.5,
                        width: width,
                        padding: EdgeInsets.only(
                            right: width / 20,
                            left: width / 20,
                            top: height / 50),
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
            ))
          ],
        ),
      ),
    );
  }
}
