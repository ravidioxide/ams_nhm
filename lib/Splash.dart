import 'package:ams_nhm/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpage.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    goto();
  }

  goto() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 1),(){
      if(sharedPreferences!.getString("token")!=null&&sharedPreferences!.getString("token")!.isNotEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      }
      
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SizedBox(height: 40),
          Image.asset('assets/uttar_pradesh.png',height:130,width:130,),
          SizedBox(height: 20),
          Container(
            child: const Text("Attendence Management System",
            style: TextStyle(color: Colors.red,
            ),),
          ),
        ],
      )),
    );
  }
}
