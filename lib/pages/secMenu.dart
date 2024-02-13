import 'package:flutter/material.dart';
import 'package:visitor_app_new/pages/vistorAdd.dart';

class SecurityMenu extends StatefulWidget {
  const SecurityMenu({super.key});

  @override
  State<SecurityMenu> createState() => _SecurityMenuState();
}

class _SecurityMenuState extends State<SecurityMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.black
                ]
            )
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              Navigator.push(context, MaterialPageRoute(builder:
              (context)=>VisitorAdd()
              ));
            },
            child: Text("Add Visitor"),),
        ),
          ],
      ),
    ),
    );
  }
}
