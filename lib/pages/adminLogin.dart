import 'package:flutter/material.dart';
import 'package:visitor_app_new/pages/menu.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    String getName="",getpass="";
    TextEditingController name=new TextEditingController();
    TextEditingController password=new TextEditingController();

    void SendAdminData(){
      if(name.text=="admin" && password.text=="12345")
        {
          print("Login Successful");
          Navigator.push(context, MaterialPageRoute(builder:
          (context)=>MenuPage()
          ));
        }
      else
        {
          print("Incorrect User Info");
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
              controller: name,
              decoration: InputDecoration(
                labelText: "User Name",
                border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  )
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
                )
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
                onPressed: SendAdminData,
              child: Text("LOGIN"),),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    )
                ),
                onPressed: (){
                
              },
              child: Text("Security click here !!!"),),
            )
          ],
        ),
      ),
    );
  }
}
