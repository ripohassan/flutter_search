
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: new MyHomePage(title: 'ListView with Search'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        //margin: EdgeInsets.only(left: 100.0,right: 12.0,top: 0.0,bottom: 0.0),
        child:Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 0.0,bottom: 0.0),
              child:Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[


                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              new Icon(Icons.where_to_vote_rounded,
                                size: 30.0,
                                color: Colors.blue,
                              ),
                              Text("Store"),
                            ],
                          ),

                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40.0,right: 40.0,top: 0.0,bottom: 0.0),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Column(
                            children: <Widget>[
                              new Icon(Icons.money,
                                size: 30.0,
                                color: Colors.blue,
                              ),
                              Text("Budget"),
                            ],
                          ),


                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:                  Column(
                          children: <Widget>[
                            new Icon(Icons.roofing,
                              size: 30.0,
                              color: Colors.blue,
                            ),
                            Text("Living/Bed"),
                          ],
                        ),


                      ),
                    ],
                  ),

                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0,right: 40.0,top: 0.0,bottom: 0.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Furniture List :",
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${items[index]}'),
                    );
                  },
                ),
              ),

            ],
          ),

      ),
    );
  }
}
