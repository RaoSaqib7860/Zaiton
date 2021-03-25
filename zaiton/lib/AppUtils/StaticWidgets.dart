import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class StaticWidgets {
   static double lat;
  static double long;

  static Future getLocation() async {
    Position position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      lat = position.latitude;
      long = position.longitude;
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        lat = position.latitude;
        long = position.longitude;
      }
    }
  }
   static Future gpsService(BuildContext context) async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      await StaticWidgets.checkGps(context);
      return null;
    } else
      return true;
  }
  static Future checkGps(BuildContext context) async {
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
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        // final AndroidIntent intent = AndroidIntent(
                        //     action:
                        //         'android.settings.LOCATION_SOURCE_SETTINGS');
                        // intent.launch();
                      })
                ],
              );
            });
      }
    }
  }
}