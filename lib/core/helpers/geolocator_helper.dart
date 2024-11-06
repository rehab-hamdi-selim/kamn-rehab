import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class GeolocatorHelper {
  static Future<Position> determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //TODO:
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorMessage(
              text: 'Please enable location services on your device',
              callback: () {
                print("errorCallback");
              },
              buttonText: 'Done',
            );
          });
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //TODO:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ErrorMessage(
                text: 'Location permissions are denied,Please enable location.',
                callback: () {
                  //  errorCallback.call();
                  print("errorCallback");
                },
                buttonText: 'Done',
              );
            });
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      //TODO:
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorMessage(
              text:
                  'Location permissions are permanently denied, we cannot request permissions.',
              callback: () {
                //  errorCallback.call();
                print("errorCallback");
              },
              buttonText: 'Done',
            );
          });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // If permissions are granted, get the current position
    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ));
  }

  double distanceBetween({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    // return distance between two positions in => (meters)
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String text;
  final Function? callback;
  final String? buttonText;

  const ErrorMessage(
      {super.key, required this.text, this.callback, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.error_outline,
        color: AppPallete.pinkyRed,
        size: 48,
      ),
      content: Text(text),
      actions: [
        TextButton(
          child: Text(
            buttonText != null ? buttonText! : "Ok",
            style: TextStyles.font10BlackColorW400,
          ),
          onPressed: () {
            Navigator.pop(context);
            if (callback != null) {
              callback!.call();
            }
          },
        )
      ],
    );
  }
}
