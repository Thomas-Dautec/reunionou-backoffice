import 'package:flutter/material.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:background_location/background_location.dart';
import 'package:geocoding/geocoding.dart';

String currentLocationAddress = "...";

void main() => runApp(Test());

class Test extends StatefulWidget {
  static String get route => '/test';
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';
  String IpAdress = '...';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Background Location Service'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              locationData('Latitude: ' + latitude),
              locationData('Longitude: ' + longitude),
              locationData('Altitude: ' + altitude),
              locationData('Accuracy: ' + accuracy),
              locationData('Bearing: ' + bearing),
              locationData('Speed: ' + speed),
              locationData('Time: ' + time),
              locationData('IpAdress: ' + IpAdress),
              locationData('Adress: ' + currentLocationAddress),
              ElevatedButton(
                  onPressed: () async {
                    await BackgroundLocation.setAndroidNotification(
                      title: 'Background service is running',
                      message: 'Background location in progress',
                      icon: '@mipmap/ic_launcher',
                    );
                    //await BackgroundLocation.setAndroidConfiguration(1000);
                    await BackgroundLocation.startLocationService(
                        distanceFilter: 20);
                    BackgroundLocation.getLocationUpdates((location) {
                      setState(() {
                        latitude = location.latitude.toString();
                        longitude = location.longitude.toString();
                        accuracy = location.accuracy.toString();
                        altitude = location.altitude.toString();
                        bearing = location.bearing.toString();
                        speed = location.speed.toString();
                        time = DateTime.fromMillisecondsSinceEpoch(
                                location.time!.toInt())
                            .toString();
                      });
                      print('''\n
                        Latitude:  $latitude
                        Longitude: $longitude
                        Altitude: $altitude
                        Accuracy: $accuracy
                        Bearing:  $bearing
                        Speed: $speed
                        Time: $time
                        IpAdress: $IpAdress
                        currentLocationAddress: $currentLocationAddress
                      ''');
                    });
                  },
                  child: Text('Start Location Service')),
              ElevatedButton(
                  onPressed: () {
                    BackgroundLocation.stopLocationService();
                  },
                  child: Text('Stop Location Service')),
              ElevatedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  child: Text('Get Current Location')),
              ElevatedButton(
                  onPressed: () {
                    GetIpAdress();
                  },
                  child: Text('Get IpAdress')),
              ElevatedButton(
                  onPressed: () {
                    getCurrentLocationAddress(latitude, longitude);
                  },
                  child: Text('Get Adress')),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationData(String data) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }

  void getCurrentLocation() {
    BackgroundLocation().getCurrentLocation().then((location) {
      print('This is current Location ' + location.toMap().toString());
    });
  }

  @override
  void dispose() {
    BackgroundLocation.stopLocationService();
    super.dispose();
  }

  void GetIpAdress() async {
    IpAdress = await Ipify.ipv64(format: Format.JSON);
  }

  getCurrentLocationAddress(String latitude, String longitude) async {
    try {
      var lati = double.tryParse(latitude);
      var longi = double.tryParse(longitude);
      List<Placemark> listPlaceMarks =
          await placemarkFromCoordinates(lati!, longi!);
      Placemark place = listPlaceMarks[0];
      setState(() {
        currentLocationAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
