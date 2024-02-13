import 'package:flutter/material.dart';
import 'package:visitor_app_new/models/visitorModel.dart';
import 'package:visitor_app_new/services/visitorServices.dart';

class ViewVisitor extends StatefulWidget {
  const ViewVisitor({super.key});

  @override
  State<ViewVisitor> createState() => _ViewVisitorState();
}

class _ViewVisitorState extends State<ViewVisitor> {
  Future<List<ViewVisitorList>> ? data;
  @override
  void initState(){
    super.initState();
    data=VisitorApiService().getVisitorData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: data,
          builder: (context,snapshot){
            if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Visitor Name:"+snapshot.data![index].visitorName),
                              subtitle: Text("Purpose of Visiting:"+snapshot.data![index].purpose + "\n" +"Address:"+snapshot.data![index].address + "\n" +
                                  "Phone Number:"+snapshot.data![index].phoneNo + "\n" + "Visited Date:"+snapshot.data![index].visitDate.toLocal().toString() + "\n"
                              + "Added By:" + snapshot.data![index].securityId.securityName),
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
