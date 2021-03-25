import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';

import 'AppUtils/NavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEnable = false;
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(left: width / 16, right: width / 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png'),
            SizedBox(
              height: height / 10,
            ),
            TextFromFieldss(
                color: Colors.white,
                hint: 'User Name'.tr,
                icon: Icons.person,
                uperhint: 'User Name'.tr,
                obsucreTextUp: false),
            SizedBox(
              height: height / 35,
            ),
            TextFromFieldss(
                color: Colors.white,
                hint: 'Password'.tr,
                icon: Icons.lock,
                postFixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (isEnable) {
                        setState(() {
                          isEnable = false;
                        });
                      } else {
                        setState(() {
                          isEnable = true;
                        });
                      }
                    }),
                uperhint: 'Password'.tr,
                obsucreTextUp: isEnable ? false : true),
            SizedBox(
              height: height / 30,
            ),
            InkWell(
              onTap: () {
                Get.to(NavigatonBar(
                  index: 1,
                ));
              },
              child: FadeInUpBig(
                child: Container(
                  height: height / 16,
                  width: width,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ZThemes.darkTheme),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFromFieldss extends StatefulWidget {
  TextFromFieldss(
      {Key key,
      this.hint,
      this.controller,
      this.icon,
      this.color,
      this.uperhint,
      this.obsucreTextUp = false,
      this.isnumber = false,
      this.enable = true,
      this.isArabic = false,
      this.postFixIcon})
      : super(key: key);
  final hint;
  final IconData icon;
  final TextEditingController controller;
  final color;
  final String uperhint;
  final bool obsucreTextUp;
  final bool isnumber;
  final bool enable;
  final bool isArabic;
  final Widget postFixIcon;
  @override
  _TextFromFieldssState createState() => _TextFromFieldssState();
}

class _TextFromFieldssState extends State<TextFromFieldss> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(seconds: 1),
      delay: Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 3,
                    spreadRadius: 2.0,
                    offset: Offset(
                      1.0,
                      0.5,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.11),
                    blurRadius: 3,
                    spreadRadius: 2.0,
                    offset: Offset(
                      2.0,
                      4.0,
                    ),
                  ),
                ],
                color: ZThemes.appTheme,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obsucreTextUp,
              enabled: widget.enable,
              keyboardType:
                  widget.isnumber == true ? TextInputType.number : null,
              style: TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: Get.height / 50),
                  suffixIcon: widget.postFixIcon,
                  prefixIcon: Icon(
                    widget.icon,
                    size: 18,
                    color: Colors.black,
                  ),
                  hintText: '${widget.hint}',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          ),
        ],
      ),
    );
  }
}
