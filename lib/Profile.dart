import 'package:ams_nhm/Models/profile_model.dart';
import 'package:ams_nhm/Networking/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late int rating;
  SharedPreferences? pref;
  ProfileResponse? profileResponse;
  ApiCalls? apiCalls;
  final nameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCalls = ApiCalls();
    initObj();
  }

  initObj() async {
    pref = await SharedPreferences.getInstance();
    profileResponse = await apiCalls!.getProfile('${pref!.getString("token")}');
    print(profileResponse!.message);
    if (profileResponse != null) {
      nameCtrl.text = profileResponse!.data.obj.name;
      emailCtrl.text = profileResponse!.data.obj.email;
      mobileCtrl.text = profileResponse!.data.obj.mobile;
      setState(() {});
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
              'Manage Profile',
            )),
        actions: <Widget>[
          Image.asset(
            'assets/uttar_pradesh.png',
            height: 30,
            width: 30,
          )
        ],
      ),
      body: profileResponse == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: Text('Edit'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User Name',
                  ),
                  validator: (test) {
                    if (test == null || test.isEmpty) {
                      return "Can't Empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  validator: (test) {
                    if (test == null || test.isEmpty) {
                      return "Can't Empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: mobileCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon:
                    Icon(Icons.mobile_friendly_rounded),
                    labelText: 'Mobile NUmber',
                  ),
                  validator: (test) {
                    if (test == null || test.isEmpty) {
                      return "Can't Empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 50,
                  child: ElevatedButton(
                      child: Text('Submit'), onPressed: () {}),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      new IconButton(
                        icon: new Icon(Icons.lock_outline),
                        highlightColor: Colors.red,
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.star_border),
                        highlightColor: Colors.red,
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.call_merge_outlined),
                        highlightColor: Colors.red,
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
