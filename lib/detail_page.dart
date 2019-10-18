import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String episodeName;
  final String summary;
  final String runtime;
  final String language;
  DetailPage({this.episodeName, this.runtime, this.summary, this.language});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(episodeName),
        elevation: 0.0,
      ),
      backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
           Text("Runtime : $runtime",style: TextStyle(fontSize: 25.0),),
            SizedBox(
              height: 5.0,
            ),
            
             Text("Language : $language",style: TextStyle(fontSize: 25.0),),
            SizedBox(
              height: 15.0,
            ),
            Text("Summary : $summary",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
            // SizedBox(height: 15.0,),
          ],
        ),
      ),
    );
  }
}
