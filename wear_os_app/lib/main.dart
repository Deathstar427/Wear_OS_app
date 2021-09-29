import 'dart:async';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wear/wear.dart';
// ignore: unused_import
import 'package:wear_os_app/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String timeString = "00:00:00"; // add from this line
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  void start() {
    stopwatch.start();
    timer = Timer.periodic(Duration(milliseconds: 1), update);
  }

  void update(Timer t) {
    if (stopwatch.isRunning) {
      setState(() {
        timeString =
            (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
                ":" +
                (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0") +
                ":" +
                (stopwatch.elapsed.inMilliseconds % 1000 / 10)
                    .clamp(0, 99)
                    .toStringAsFixed(0)
                    .padLeft(2, "0");
      });
    }
  }

  void stop() {
    setState(() {
      timer.cancel();
      stopwatch.stop();
    });
  }

  void reset() {
    timer.cancel();
    stopwatch.reset();
    setState(() {
      timeString = "00:00:00";
    });
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Stop Watch",
      //     strutStyle: StrutStyle(fontSize: 0.5),
      //   ),
      // ),
      body: WatchShape(
        builder: (context, shape, child) {
          return SingleChildScrollView(
              child: Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              //widthFactor: 100,
              //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
              child: Text("STOPWATCH",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  )),
            ),
            SizedBox(height: 5),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.black38,
                          blurRadius: 15),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.white.withOpacity(0.85),
                          blurRadius: 15),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.timer, size: 40, color: Colors.grey.shade900),
                    Text("00:00:00",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade900))
                  ],
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      onPressed: reset,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10),
                                  color: Colors.black38,
                                  blurRadius: 15),
                              BoxShadow(
                                  offset: Offset(-10, -10),
                                  color: Colors.white.withOpacity(0.85),
                                  blurRadius: 15)
                            ]),
                        child: Icon(
                          Icons.refresh,
                        ),
                      )),
                  FlatButton(
                      onPressed: () {
                        stopwatch.isRunning ? stop() : start();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 15),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Colors.white.withOpacity(0.85),
                                blurRadius: 15)
                          ],
                        ),
                        child: Icon(Icons.play_arrow),
                      )),
                ]),
            //       ),
            //     ),),
            // Text("hi"),

            //   Expanded(
            //     child: Container(
            //       width: 28,
            //       height: 28,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade200,
            //         shape: BoxShape.circle,
            //         // boxShadow: [
            //         //   BoxShadow(
            //         //       offset: Offset(10, 10),
            //         //       color: Colors.black38,
            //         //       blurRadius: 15),
            //         //   BoxShadow(
            //         //       offset: Offset(-10, -10),
            //         //       color: Colors.white.withOpacity(0.85),
            //         //       blurRadius: 15)
            //         // ]),
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           Icon(Icons.timer, size: 9, color: Colors.grey.shade900),
            //           Text("00:00:00",
            //               style: TextStyle(
            //                   fontSize: 4, color: Colors.grey.shade900))
            //         ],
            //       ),
            //     ),
            //   ),
            //   Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: <Widget>[
            //             FlatButton(
            //                 onPressed: () {},
            //                 child: Container(
            //                   height: 10,
            //                   width: 10,
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade200,
            //                     shape: BoxShape.circle,
            //                     // boxShadow: [
            //                     //   BoxShadow(
            //                     //       offset: Offset(10, 10),
            //                     //       color: Colors.black38,
            //                     //       blurRadius: 15),
            //                     //   BoxShadow(
            //                     //       offset: Offset(-10, -10),
            //                     //       color: Colors.white.withOpacity(0.85),
            //                     //       blurRadius: 15)
            //                     // ]),
            //                   ),
            //                   child: Icon(Icons.refresh, size: 60),
            //                 )),
            //             FlatButton(
            //                 onPressed: () {},
            //                 child: Container(
            //                   height: 10,
            //                   width: 10,
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade200,
            //                     shape: BoxShape.circle,
            //                     // b
            //                   ),
            //                   child: Icon(Icons.play_arrow, size: 60),
            //                 ))
            //           ]))
            // ]

            //         // Column(
            //         //   mainAxisAlignment: MainAxisAlignment.center,
            //         //   children: [
            //         //     Text(
            //         //       'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
            //         //     ),
            //         //     //child,
            //         //     ElevatedButton(
            //         //       onPressed: () {},
            //         //       child: Text("Hello there"),
            //         //     ),
            //         //     InkWell(
            //         //       child: ListTile(
            //         //         leading: IconButton(
            //         //           icon: Icon(Icons.access_alarm),
            //         //           onPressed: () {},
            //         //         ),
            //         //         title: Text('Alarm'),
            //         //       ),
            //         //       onTap: () {
            //         //         print('Hello');
            //         //       },
            //         //     ),
            //         //     ListTile(
            //         //       leading: IconButton(
            //         //         icon: Icon(Icons.access_alarm),
            //         //         onPressed: () {},
            //         //       ),
            //         //       title: Text('Alarm'),
            //         //     ),
            //         //     ListTile(
            //         //       leading: IconButton(
            //         //         icon: Icon(Icons.access_alarm),
            //         //         onPressed: () {},
            //         //       ),
            //         //       title: Text('Alarm'),
            //         //     ),
            //         //     ListTile(
            //         //       leading: IconButton(
            //         //         icon: Icon(Icons.access_alarm),
            //         //         onPressed: () {},
            //         //       ),
            //         //       title: Text('Alarm'),
            //         //     ),
            //         //     ListTile(
            //         //       leading: IconButton(
            //         //         icon: Icon(Icons.access_alarm),
            //         //         onPressed: () {},
            //         //       ),
            //         //       title: Text('Alarm'),
            //         //     ),
            //         //     ListTile(
            //         //       leading: IconButton(
            //         //         icon: Icon(Icons.access_alarm),
            //         //         onPressed: () {},
            //         //       ),
            //         //       title: Text('Alarm'),
            //         //     ),
            //         //   ],
            //         // ),
          ]));
        },
        child: AmbientMode(
          builder: (context, mode, child) {
            return Text(
              'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
            );
          },
        ),
      ),
    );
  }
}
