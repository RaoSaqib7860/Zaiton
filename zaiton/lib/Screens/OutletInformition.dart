import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';
import 'package:zaiton/Screens/EditOutlet.dart';

class OutletInformition extends StatefulWidget {
  OutletInformition({Key key}) : super(key: key);

  @override
  _OutletInformitionState createState() => _OutletInformitionState();
}

class _OutletInformitionState extends State<OutletInformition> {
  List<Marker> myMarker = [];
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<int> listDatas = [];
  Completer<GoogleMapController> _controller = Completer();
  LatLng latLng;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  DateFormat sdf2 = DateFormat("hh.mm aa");
  Future<void> getLocation() async {
    Position position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      setState(() {
        latLng = LatLng(position.latitude, position.longitude);
      });
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        setState(() {
          latLng = LatLng(position.latitude, position.longitude);
        });
      }
    }
  }

  bool onMap = false;
  @override
  void initState() {
    _gpsService();
    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _gpsService() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  Future _checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get gurrent location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(child: Text('Ok'), onPressed: () {})
                ],
              );
            });
      }
    }
  }

  bool selectRidetoConform = false;
  bool opacity = false;
  Future onbackPress(Completer<GoogleMapController> controller) async {
    final GoogleMapController controller = await _controller.future;
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;

    return Scaffold(
      backgroundColor: ZThemes.offGrey,
      body: Container(
        height: height,
        width: width,
        child: ListView(
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
                        'Osama General store',
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
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 4,
              width: width,
              child: getCurrentLocation(),
              margin: EdgeInsets.only(left: width / 20, right: width / 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                        offset: Offset(-5, -5)),
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                        offset: Offset(5, 5))
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blueGrey[300]),
            ),
            SizedBox(
              height: height / 100,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 17),
                child: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: ZThemes.appTheme,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Outlet Name',
              description: 'Osman general store',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Address',
              description: 'Block_3 street 11 islamabad',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Outlet Type',
              description: 'Outlet Type',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Owner Name',
              description: 'Abuzar',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'City',
              description: 'Islamabad',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Phone',
              description: '123456789',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Email',
              description: 'example@gmail.com',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Zone',
              description: 'Zone',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Sub Zone',
              description: 'Sub Zone',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Area',
              description: 'Area',
            ),
            SizedBox(
              height: height / 50,
            ),
            InformationText(
              title: 'Sub Area',
              description: 'Sub Area',
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: width / 20),
                  height: height / 20,
                  width: width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_box_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Text(
                        'Order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: ZThemes.appTheme,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 20),
                  height: height / 20,
                  width: width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_box_rounded,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Text(
                        'Return',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: ZThemes.appTheme,
                      borderRadius: BorderRadius.circular(8)),
                ),
                InkWell(
                  onTap: () {
                    Get.to(EditOutlet());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: width / 20),
                    height: height / 20,
                    width: width / 4,
                    child: Center(
                      child: Text(
                        'Edit Order',
                        style: TextStyle(
                            color: ZThemes.appTheme,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: ZThemes.appTheme),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
          ],
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget getCurrentLocation() {
    if (latLng == null) {
      return Container(
        child: CupertinoActivityIndicator(),
      );
    } else {
      return GoogleMap(
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        tiltGesturesEnabled: false,
        initialCameraPosition: CameraPosition(
          target: latLng == null ? LatLng(000.00, 00.00) : latLng,
          zoom: 17,
        ),
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(myMarker),
        onTap: _handleTap,
      );
    }
  }

  _handleTap(LatLng tapedPoint) {
    print(tapedPoint);
    setState(() {
      latLng = tapedPoint;
      print(latLng);
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tapedPoint.toString()),
          position: tapedPoint,
          draggable: true,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onDragEnd: (dragableendPosition) {
            latLng = dragableendPosition;
          }));
    });
  }
}

class InformationText extends StatefulWidget {
  final String title;
  final String description;
  InformationText({Key key, this.title, this.description}) : super(key: key);

  @override
  _InformationTextState createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Padding(
      padding: EdgeInsets.only(left: width / 20, right: width / 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.title}',
            style: TextStyle(color: ZThemes.darkTheme, fontSize: 11),
          ),
          SizedBox(
            height: height / 150,
          ),
          Text(
            '${widget.description}',
            style: TextStyle(
              color: ZThemes.appTheme,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Container(
            width: width,
            height: 1,
            color: Colors.blueGrey[100],
          )
        ],
      ),
    );
  }
}
