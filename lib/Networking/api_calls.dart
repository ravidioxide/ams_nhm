import 'dart:convert';
import 'package:ams_nhm/Models/login_model.dart';
import 'package:ams_nhm/Models/profile_model.dart';
import 'package:ams_nhm/Networking/config.dart';
import 'package:http/http.dart' as http;

class ApiCalls{

    Future<LoginResponse?>login(String email,String password)async{
      final requestParam=json.encode({
        "email":email,
        "password":password
      });

      final response = await http.post(Uri.parse(LOGIN_URL),
          body:requestParam, headers:{"Content-Type":"application/json"});
      print(response.body);
      if(response.statusCode==200) {
        return loginResponseFromJson(response.body);
      } else {
        return null;
      }
    }

    Future<ProfileResponse?>getProfile(String token)async{
      final response=await http.get(Uri.parse(PROFILE_URL),
      headers: {
        "Content-Type":"application/json",
        "Authorization":"Bearer $token"
      }
      );
      if(response.statusCode==200){
        return profileResponseFromJson(response.body);
      }else{
        return null;
      }
    }

  }
  
