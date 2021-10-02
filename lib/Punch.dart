import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/punch_model.dart';
import 'Networking/api_calls.dart';

class PunchAttendence extends StatefulWidget {
  @override
  _PunchAttendenceState createState() => _PunchAttendenceState();
}

class _PunchAttendenceState extends State<PunchAttendence> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  String distance ='';
  ApiCalls? apiCalls;
  PunchResponse? punchResponse;
  SharedPreferences? prefs;
  File? picture;
  String imageBase64 = '';
  String imagePath = '';
  bool inRadio = false, outRadio = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCalls = ApiCalls();
    initObj();
  }

  _pickImage(String source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(
        source: source == 'gallery' ? ImageSource.gallery : ImageSource.camera);
    if (image != null) {
      imagePath = image.path;
      picture = File(imagePath);
      List<int> imageBytes = picture!.readAsBytesSync();
      imageBase64 = base64Encode(imageBytes);
      print(imageBase64);
      setState(() {});
    }
  }

  initObj() async {
    prefs = await SharedPreferences.getInstance();
    Position? postion = await getCurrentPosition();
    if (postion != null) {
      double distancemtr = Geolocator.distanceBetween(
          postion.latitude, postion.longitude, 26.8635836, 81.000694);
      if (distancemtr > 1000) {
        distance=(distancemtr / 1000).toStringAsFixed(2)+"km" ;
      } else {
        distance='$distancemtr mtr';
      }
     setState(() {

     });
    } else {
      print('Unable to get location');
    }
  }

  Future<Position?> getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (hasPermission) {
      return await _geolocatorPlatform.getCurrentPosition();
    }

    return null;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // _openLocationSettings();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // _openAppSettings();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          'Punch Attendence',
        )),
        actions: <Widget>[
          Image.asset('assets/uttar_pradesh.png', height: 50, width: 50)
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/man.png',
                              height: 80,
                              width: 80,
                            )),
                        Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 20, left: 20, top: 20),
                                    child: Image.asset('assets/arrow.png')),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text('$distance'),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Image.asset('assets/officepic.png',
                              height: 80,
                              width: 120,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('You are $distance Meters  away from your office',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Text(''),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Punch Attendence',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Icon(
                                inRadio
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: Colors.red,
                              ),
                              onTap: () {
                                inRadio = true;
                                outRadio = false;
                                setState(() {});
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Punch In'),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  inRadio = false;
                                  outRadio = true;
                                  setState(() {});
                                },
                                child: Icon(
                                  outRadio
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: Colors.red,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Punch Out'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Please Capture selfie to mark your Attendence .",
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        _pickImage('camera');
                      },
                      child: picture == null
                          ? Icon(
                              Icons.camera_enhance,
                              size: 60,
                              color: Colors.red,
                            )
                          : Image.file(
                              picture!,
                              height: 100,
                            ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                      child: ElevatedButton(
                          child: Text('Submit'), onPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
