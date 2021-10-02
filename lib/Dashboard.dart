import 'package:ams_nhm/Profile.dart';
import 'package:ams_nhm/Punch.dart';
import 'package:ams_nhm/Viewattendence.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name = 'jkshdjs';
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initObj();
  }

  initObj() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('My Token : ${sharedPreferences!.getString("token")}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(
                child: Text(
              'DashBoard',
            )),
            actions: <Widget>[
              Image.asset('assets/uttar_pradesh.png',
              alignment: Alignment.topLeft),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome,', style: TextStyle(color: Colors.white)),
                      Text('${sharedPreferences!.getString("name")}',
                          style: TextStyle(color: Colors.white)),
                      Text('${DateTime.now()}',style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6.0)),
                            padding: EdgeInsets.all(8),
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Punch',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)),
                                getTextWidget('Attendence', 12.0),
                                getTextWidget('(Daily Punch Your Attendence)', 10.0),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PunchAttendence()));
                        }),
                  ),
                  Expanded(
                    child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(8.0)),
                            padding: EdgeInsets.all(8),
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  getTextWidget('View', 12.0),
                                  getTextWidget('Attendence', 12.0),
                                  getTextWidget(
                                      '(View your Daily Attendence)', 10.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewAttendence()));
                        }),
                  )
                ],
              ),
              InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(8),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                getTextWidget('Manage Profile', 12.0),
                                getTextWidget('(See Profile,Change Password etc)', 10.0),
                              ],
                            ),
                          ),
                          Image.asset('assets/profilere.png'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  }),
            ],
          ),
        ));
  }
}

Widget getTextWidget(String text, fontSize) {
  return Text(
    text,
    style: TextStyle(color: Colors.white, fontSize: fontSize),
  );
}
