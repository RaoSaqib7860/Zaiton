import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:intl/intl.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';
import 'AddOutlet.dart';

class EditOutlet extends StatefulWidget {
  EditOutlet({Key key}) : super(key: key);

  @override
  _EditOutletState createState() => _EditOutletState();
}

class _EditOutletState extends State<EditOutlet> {
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
      backgroundColor: Colors.white,
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
                        'Add Outlet',
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
            InkWell(
              onTap: () {
                _settingModalBottomSheet(context);
              },
              child: Container(
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
            TextFromFieldssForAdd(
                color: Colors.white,
                hint: 'Outlet Name'.tr,
                obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Address'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white,
                hint: 'Outlet Type'.tr,
                obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white,
                hint: 'Owner Name'.tr,
                obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'City'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Phone'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Email'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Zone'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Sub Zone'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Area'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 80,
            ),
            TextFromFieldssForAdd(
                color: Colors.white, hint: 'Sub Area'.tr, obsucreTextUp: false),
            SizedBox(
              height: height / 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: width / 20),
                height: height / 20,
                width: width / 3.5,
                child: Center(
                  child: Text(
                    'Update',
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

  PickResult selectedPlace;
  LatLng kInitialPosition = LatLng(-33.8567844, 151.213108);
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
       backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (BuildContext bc) {
          return Column(
            children: [
              SizedBox(height:Get.height/30,),
                Center(
                child: Container(
                  height: Get.height / 140,
                  width: Get.width / 5,
                  decoration: BoxDecoration(
                      color: ZThemes.appTheme,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(
                height: Get.height / 80,
              ),
              Container(
                height: Get.height / 2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: PlacePicker(
                  apiKey: 'AIzaSyC-ADl5riVsKPU8F9qe1jOLVQwGSdh_bOo',
                  initialPosition: kInitialPosition,
                  useCurrentLocation: true,
                  selectInitialPosition: true,

                  //usePlaceDetailSearch: true,
                  onPlacePicked: (result) {
                    selectedPlace = result;
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  //forceSearchOnZoomChanged: true,
                  automaticallyImplyAppBarLeading: false,
                  //autocompleteLanguage: "ko",
                  //region: 'au',
                  //selectInitialPosition: true,
                  // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                  //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                  //   return isSearchBarFocused
                  //       ? Container()
                  //       : FloatingCard(
                  //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                  //           leftPosition: 0.0,
                  //           rightPosition: 0.0,
                  //           width: 500,
                  //           borderRadius: BorderRadius.circular(12.0),
                  //           child: state == SearchingState.Searching
                  //               ? Center(child: CircularProgressIndicator())
                  //               : RaisedButton(
                  //                   child: Text("Pick Here"),
                  //                   onPressed: () {
                  //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                  //                     //            this will override default 'Select here' Button.
                  //                     print("do something with [selectedPlace] data");
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //         );
                  // },
                  // pinBuilder: (context, state) {
                  //   if (state == PinState.Idle) {
                  //     return Icon(Icons.favorite_border);
                  //   } else {
                  //     return Icon(Icons.favorite);
                  //   }
                  // },
                ),
              ),
            ],
          );
        });
  }
}
