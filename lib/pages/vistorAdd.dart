import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor_app_new/services/visitorServices.dart';

class VisitorAdd extends StatefulWidget {
  const VisitorAdd({super.key});

  @override
  State<VisitorAdd> createState() => _VisitorAddState();
}

class _VisitorAddState extends State<VisitorAdd> {
  @override
  Widget build(BuildContext context) {
    String getName="",getPurpose="",getAddress="",getPhno="";
    TextEditingController visitorName=new TextEditingController();
    TextEditingController purpose=new TextEditingController();
    TextEditingController address=new TextEditingController();
    TextEditingController phoneNo=new TextEditingController();

    void SendVisitor() async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      String securityId=preferences.getString("securityId")??"";

      final response=await VisitorApiService().sendVisitorData(
          securityId,
          visitorName.text,
          purpose.text,
          address.text,
          phoneNo.text);

      if(response["status"]=="success")
      {
        print("visitor added");
      }
      else
      {
        print("error");
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("GateGaurd Log",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.black
                ]
            )
        ),
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("Details Of Visitor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            TextField(
              controller: visitorName,
              decoration: InputDecoration(
                  labelText: "Visitor Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: purpose,
              decoration: InputDecoration(
                  labelText: "Purpose of Visiting",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: address,
              decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: phoneNo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: SendVisitor,
                child: Text("SUBMIT"),),
            ),
          ],
        ),
      ),
    );
  }
}
