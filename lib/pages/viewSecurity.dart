import 'package:flutter/material.dart';
import 'package:visitor_app_new/models/securityModel.dart';
import 'package:visitor_app_new/services/securityServices.dart';

class ViewSecurity extends StatefulWidget {
  const ViewSecurity({super.key});

  @override
  State<ViewSecurity> createState() => _ViewSecurityState();
}

class _ViewSecurityState extends State<ViewSecurity> {
  Future<List<ViewList>> ? data;
  @override
  void initState(){
    super.initState();
    data=SecurityApiServices().getSecurityData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("GateGaurd Log",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
      ),
      body: FutureBuilder(
          future: data,
          builder: (context,snapshot){
            if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (values,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Security Name:"+snapshot.data![index].securityName),
                              subtitle: Text("Security Id:"+snapshot.data![index].securityId + "\n" +"Address:"+snapshot.data![index].address + "\n" +
                              "Phone Number:"+snapshot.data![index].phoneNo + "\n" + "Email Id:"+snapshot.data![index].email + "\n" +
                                  "Password:"+snapshot.data![index].password),
                            )
                          ],
                        ),
                      );
                    });
              }
            else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }),
    );
  }
}
