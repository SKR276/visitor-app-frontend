import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitor_app_new/models/visitorModel.dart';

class VisitorApiService{
  Future<dynamic> sendVisitorData(
      String securityId,String visitorName,String purpose,String address,String phoneNo)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/visitors/add");
    var response=await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "securityId":securityId,
          "visitorName":visitorName,
          "purpose":purpose,
          "address":address,
          "phoneNo":phoneNo
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
  Future<List<ViewVisitorList>> getVisitorData() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/visitors/viewall");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return viewVisitorListFromJson(response.body);
    }
    else
    {
      return [];
    }
  }

}