

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class DetailsPage extends StatelessWidget {
  static const String routeName = "/detailspage";


  List _list = [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String text = "";
    if(arguments != null)
      text = arguments['tata'];

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ListView.separated(
          itemBuilder: (context, position){
            return ListTile(
              leading: Icon(Icons.accessibility),
              title: Text("Je suis un titre"),
              subtitle: Text("Je suis un sous titre"),
            );
          },
          separatorBuilder: (context,position){
            return Divider();
          },
          itemCount: 42+1
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text("Circle")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.adb),
              title: Text("adb")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text("go hard")
          )
        ],
        backgroundColor: Colors.blue,
      ),
    );
  }

}