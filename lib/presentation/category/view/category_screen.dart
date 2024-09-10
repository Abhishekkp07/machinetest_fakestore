import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: category_screen(),
  ));
}

class category_screen extends StatefulWidget {
  const category_screen({super.key});

  @override
  State<category_screen> createState() => _category_screenState();
}

class _category_screenState extends State<category_screen> {

  var category=[ "ELECTRONICS",
    "JEWELERY",
   " MEN_S_CLOTHING",
   " WOMEN_S_CLOTHING"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CATEGORY"),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => GestureDetector(

                child: Card(elevation:10,
                child: ListTile(
                  title: Text(category[index]),
                )),
              )),
        ),
      ),
    );
  }
}
