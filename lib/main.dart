import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[800],
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            )
          ),


          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text("John Doe", style: TextStyle(color: Colors.white, fontSize:20)),
                        
                      ],
                    )
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.white), 
                          title: Text('Home', style: TextStyle(color: Colors.white)), 
                          onTap: () {}
                        ),   
                      ]
                    )
                  ),
                ],
              )  
            )
          ),





          // main screen

          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value), 
            duration: Duration(milliseconds: 500), 
            builder: (_, double value, __) {
              return (
                Transform(
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * value)
                  ..rotateY((pi / 6) * value),
                  child: Scaffold(
                    body: Container(
                      color: Colors.orange,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Hello')
                          ],
                        ),
                      )
                    )
                  )
                )

              );
            }
          ),



          GestureDetector(
           onHorizontalDragUpdate: (e) {
             if(e.delta.dx > 0) {
               setState(() {
                 value = 1;
               });
             } else {
               setState(() {
                 value = 0;
               });
             }
           },
          ),




        ],
      )
    );
  }
}
