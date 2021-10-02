import 'dart:convert';
import 'dart:io';
import 'package:ams_nhm/Models/login_model.dart';
import 'package:ams_nhm/Networking/api_calls.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboard.dart';


class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<Login> {
  bool isUserNameError=true;
  bool isPasswordError=true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ApiCalls? apiCalls;
  LoginResponse? loginResponse;
  SharedPreferences? prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCalls=ApiCalls();
    initObj();
  }

  initObj()async{
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Center(
           child: Padding(
              padding: EdgeInsets.all(8),
               child: SingleChildScrollView(
                 child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image.asset('assets/uttar_pradesh.png',height:100),
                    SizedBox(height: 10,),
                    Text('Attendence Management System',
                      style: TextStyle(
                          color: Colors.red,

                          fontSize: 20),
                    ),
                    SizedBox(height: 20,),
                    Text('Mobile App',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (value){
                          if (value==null || value.isEmpty){
                            return "Can't Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: 'Password',
                        ),
                        validator: (value){
                          if (value==null || value.isEmpty){
                            return "Can't Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: (){
                          //forgot password screen
                        },
                        child: Text('Forgot Password ?'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding:const EdgeInsets.fromLTRB(10, 10, 10, 8),
                        child: ElevatedButton(

                          child: Text('Login'),
                          onPressed: () async{
                            if(nameController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                              loginResponse=await apiCalls!.login(nameController.text, encrypt(passwordController.text));
                              if(loginResponse!=null&&loginResponse!.status){
                                prefs!.setString("token", loginResponse!.data.response.jwtToken);
                                prefs!.setString("name", loginResponse!.data.response.userName);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
                              }

                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter required values')));
                            }


                          },
                        )),
                  ],
              ),
               )),
         ));
  }

  String encrypt(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

}
