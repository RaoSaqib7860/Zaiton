import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:zaiton/AppUtils/StaticWidgets.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    StaticWidgets.gpsService(context);
    StaticWidgets.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapCalss(),
    );
  }
}

class MapCalss extends StatefulWidget {
  MapCalss({Key key}) : super(key: key);

  @override
  _MapCalssState createState() => _MapCalssState();
}

class _MapCalssState extends State<MapCalss> {
  PickResult selectedPlace;
  bool opacity = false;
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
    LatLng kInitialPosition = LatLng(-33.8567844, 151.213108);
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: height / 1.6,
          width: width,
          margin: EdgeInsets.only(bottom: height / 12),
          decoration: BoxDecoration(color: Colors.yellow),
          child: PlacePicker(
            apiKey: 'AIzaSyC-ADl5riVsKPU8F9qe1jOLVQwGSdh_bOo',
            initialPosition: kInitialPosition,
            useCurrentLocation: true,
            selectInitialPosition: true,
            //usePlaceDetailSearch: true,
            onPlacePicked: (result) {
              // selectedPlace = result;
              // Navigator.of(context).pop();
              // setState(() {});
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
        Container(
          child: SizedBox.expand(
              child: NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification notification) {
              // if (notification.extent > 7) {
              //   setState(() {
              //     opacity = true;
              //   });
              // } else if (notification.extent < 1) {
              //   setState(() {
              //     opacity = false;
              //   });
              // }
              return true;
            },
            child: DraggableScrollableSheet(
              maxChildSize: 1.0,
              minChildSize: 0.3,
              initialChildSize: 0.3,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20),
                  decoration: BoxDecoration(
                      color: ZThemes.offGrey,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(-5, -5))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: list.map((e) {
                      int index = list.indexOf(e);
                      if (index == 0) {
                        return Column(
                          children: [
                            SizedBox(
                              height: height / 50,
                            ),
                            Center(
                              child: Container(
                                height: height / 140,
                                width: width / 5,
                                decoration: BoxDecoration(
                                    color: ZThemes.appTheme,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Align(
                              child: Text(
                                ' Outlets',
                                style: TextStyle(
                                    color: ZThemes.appTheme,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Container(
                              height: height / 9,
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
                            )
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: height / 50,
                            ),
                            Container(
                              height: height / 9,
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
                        );
                      }
                    }).toList(),
                    controller: scrollController,
                  ),
                );
              },
            ),
          )),
        ),
      ],
    ));
  }
}
