import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitor_app_new/models/securityModel.dart';

class SecurityApiServices{
  Future<dynamic> sendSecurityData(
      String securityName,String securityId,String address,String phoneNo,String email,String password)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/securities/signup");
    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "securityName":securityName,
          "securityId":securityId,
          "address":address,
          "phoneNo":phoneNo,
          "email":email,
          "password":password
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to send");
    }
  }

  Future<dynamic> sendLoginData(
      String email,String password)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/securities/signin");

    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "email":email,
          "password":password
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to send");
    }
  }

  Future<List<ViewList>> getSecurityData() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/securities/viewall");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return viewListFromJson(response.body);
    }
    else
    {
      return [];
    }
  }
}