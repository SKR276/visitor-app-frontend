import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                child: Text("Add Security"),),
            ),
            SizedBox(height: 20,),
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
                child: Text("View all Securities"),),
            ),
            SizedBox(height: 20,),
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
                child: Text("View All Visitors"),),
            ),
          ],
        ),
      ),
    );
  }
}
