import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CarasolSliders extends StatefulWidget {
  CarasolSliders({Key key, this.list}) : super(key: key);
  final List list;
  @override
  _CarasolSlidersState createState() => _CarasolSlidersState();
}

class _CarasolSlidersState extends State<CarasolSliders> {
  int _curent;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(
            items: widget.list.map((item) {
              int index = widget.list.indexOf(item);
              Asset asset = widget.list[index];
              return AssetThumb(
                asset: asset,
                height: height ~/ 3.6,
                width: width.toInt(),
              );
            }).toList(),
            options: CarouselOptions(
              height: height / 3.6,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _curent = index;
                });
              },
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
        Expanded(
          child: Row(
            children: widget.list.map((item) {
              int index = widget.list.indexOf(item);
              return _curent == index
                  ? Container(
                      margin: EdgeInsets.all(width / 100),
                      height: height / 100,
                      width: width / 50,
                      decoration: BoxDecoration(
                          color: Colors.yellow, shape: BoxShape.circle),
                    )
                  : Container(
                      margin: EdgeInsets.all(width / 100),
                      height: height / 100,
                      width: width / 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 0.5),
                          color: Colors.black,
                          shape: BoxShape.circle),
                    );
            }).toList(),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ],
    );
  }
}
