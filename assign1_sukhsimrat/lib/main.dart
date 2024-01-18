import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body:Container( 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Column for Container 1 and Container 2
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.black, 
                      width: 3, 
                    ),
                  ),
                  height: 100,
                  width: 100,
                  child: const Center(child: Text('Container 1')),
                  ),
                
                Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    width: 100,
                    child: const Center(child: Text('Container 2')),
                  ),
                ),
              ],
            ),
            //Column for Container 3 and Container 4
           Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10), 
                child: Container(
                  color: Colors.yellow,
                  height: 370, 
                  width: 100,
                  child: const Center(child: Text('Container 3')),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 370, 
                width: 100,
                child: const Center(child: Text('Container 4')),
              ),
            ],
          ),
            //Column for Container 5 and Container 6
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: <Widget>[
               Padding(
                padding: const EdgeInsets.only(top: 150), 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.white), 
                  ),
                  height: 100,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Container 5',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter, 
                    child: Container(
                      color: Colors.red,
                      height: 300,
                      width: 100,
                        child: const Text(
                          'Con 6',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),         
                    ),
                  ),
                ),
              ],
            ),
      ],
    ),
  ),
 ),
);
}
}
