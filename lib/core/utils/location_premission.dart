import 'package:location/location.dart';

PermissionStatus? permissionGranted;
Location location = Location();

Future<bool> isPermissionGranted() async {
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}

Future<bool> isServiceEnabled() async {
  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return false;
    }
  }
  return true;
}
