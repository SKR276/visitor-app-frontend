import 'package:flutter/material.dart';
import 'package:visitor_app_new/services/securityServices.dart';

class AddSecurity extends StatefulWidget {
  const AddSecurity({super.key});

  @override
  State<AddSecurity> createState() => _AddSecurityState();
}

class _AddSecurityState extends State<AddSecurity> {
  @override
  Widget build(BuildContext context) {
    String getName="",getId="",getAddress="",getPhn="",getEmail="",getPass="";

    TextEditingController securityName=new TextEditingController();
    TextEditingController securityId=new TextEditingController();
    TextEditingController address=new TextEditingController();
    TextEditingController phoneNo=new TextEditingController();
    TextEditingController email=new TextEditingController();
    TextEditingController password=new TextEditingController();

    void SendSecurityValues() async{
      final response=await SecurityApiServices().sendSecurityData(
          securityName.text,
          securityId.text,
          address.text,
          phoneNo.text,
          email.text,
          password.text);

      if(response["status"]=="success")
        {
          print("security details added successfully");
        }
      else
        {
          print("Error");
        }
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.black
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text("Details Of Security",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            TextField(
              controller: securityName,
              decoration: InputDecoration(
                labelText: "Security Name",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: securityId,
              decoration: InputDecoration(
                  labelText: "Security ID",
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
            SizedBox(height: 15,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Email ID",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 25,),
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
                onPressed: SendSecurityValues,
                child: Text("ADD SECURITY"),),
            ),
            SizedBox(height: 30,),
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
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Back to Menu"),),
            ),
          ],
        ),
      ),
    );
  }
}
