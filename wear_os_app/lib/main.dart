import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
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
      themeMode: ThemeMode.dark,
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

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        
        child: WatchShape(
          builder: (context,shape,child){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Shape: ${shape==WearShape.round?'round':'square'}',),
                  child,
                  ElevatedButton(onPressed: (){}, child: Text("Hello there"),),
                  InkWell(child: ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),onTap:(){print('Hello');},),
                  ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),
                  ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),
                  ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),
                  ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),
                  ListTile(leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: (){},),title: Text('Alarm'),),
                ],
              ),
            );
          },
          child: AmbientMode(
            builder: (context, mode, child){
              return Text(
                'Mode: ${mode==WearMode.active ?'Active':'Ambient'}',
              );
            },
          ),
        ),
      ),
      
    );
  }
}
