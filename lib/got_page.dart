import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gameofthronesapp/detail_page.dart';
import 'package:http/http.dart' as http;

Color mainColor = Colors.amber;
Color secondaryColor = Colors.black;

class GotPage extends StatefulWidget {
  @override
  _GotPageState createState() => _GotPageState();
}

class _GotPageState extends State<GotPage> {
  var data;
  @override
  void initState() {
    
    super.initState();
    fetchData();
  }

  fetchData() async {
    
    var res = await http.get(
        "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes");
    data = jsonDecode(res.body);
    setState(() {});
  }

showGridWidget(){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GridView.builder(
      itemCount: data["_embedded"]["episodes"].length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 3/2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (BuildContext context, int index){
        var episode = data["_embedded"]["episodes"][index];
       return GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(
             builder: (context) => DetailPage(
               episodeName: episode["name"],
               summary: episode["summary"],
               language: data["language"],
               runtime: episode["runtime"].toString(),
             )
           ));
         },
         child: Card(
         clipBehavior: Clip.antiAlias,
         child: Stack(
           fit: StackFit.expand,
           children: <Widget>[
             Image.network(episode["image"]["original"],fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(episode["name"],style: TextStyle(
                  color: Colors.white
                ),),
              ),
            
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0))
                ),
                child: Text("S${episode["season"]}E${episode["number"]}"),
              ),
            )
           ],
         ),
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20.0),

),

       ),);
      },
    ),
  );
}
  dataBody(BuildContext context) {
    var imageUrl = data["image"]["original"];
    var body = Column(
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: MediaQuery.of(context).size.width > 600? 150:60,
          ),
        ),
        SizedBox(height: 20.0,),
        Text(data["name"]),
         SizedBox(height: 20.0,),
        Expanded(child:  showGridWidget(),),
      ],
    );
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('GOT 2019'),
        elevation: 0.0,
      ),
      body: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataBody(context),
    );
  }
}
