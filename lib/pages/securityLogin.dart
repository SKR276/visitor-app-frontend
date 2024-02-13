import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor_app_new/services/securityServices.dart';

class SecurityLogin extends StatefulWidget {
  const SecurityLogin({super.key});

  @override
  State<SecurityLogin> createState() => _SecurityLoginState();
}

class _SecurityLoginState extends State<SecurityLogin> {
  @override
  Widget build(BuildContext context) {
    String getEmail="",getPass="";
    TextEditingController email=new TextEditingController();
    TextEditingController password=new TextEditingController();

    void SendValues() async{
      final response=await SecurityApiServices().sendLoginData(
          email.text,
          password.text);
      if(response["status"]=="success")
        {
          print("Login Successful");
        }
      else if(response["status"]=="invalid mail id")
      {
        print("incorrect mail id");
      }
      else
      {
        print("incorrect password");
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
            CircleAvatar(
              backgroundImage: NetworkImage("https://png.pngtree.com/template/20191017/ourlarge/pngtree-security-guard-logo-design-vector-image_320352.jpg"),
              radius: 70,
            ),
            SizedBox(height: 45,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email ID",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
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
                onPressed: SendValues,
                child: Text("LOGIN"),),
            ),
          ],
        ),
      ),
    );
  }
}
