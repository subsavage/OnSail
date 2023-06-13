import 'package:flutter/material.dart';
import 'package:ecommece_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(itemList[index]["title"]),
              subtitle: Text(itemList[index]["description"]),
            ),
          );
        },
        itemCount: itemList.length,
      ),
    );
  }
}
