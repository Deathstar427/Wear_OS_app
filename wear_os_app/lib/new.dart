import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wear/wear.dart';

class NewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _NewPageState();

}

class _NewPageState extends State<NewPage>{
  Duration duration=Duration();
  Timer? timer;

  @override
  void initState(){
    super.initState();

    //startTimer();
    reset();
  }
  void reset(){
    setState(() {
      duration=Duration();
    });
  }
  void addTime(){
    final addSeconds=1;
    setState(() {
      final seconds=duration.inSeconds+addSeconds;

      duration=Duration(seconds: seconds);
    });
  }

  void startTimer(){
    timer=Timer.periodic(Duration(seconds:1),(_)=>addTime());
  }

  void stopTimer({bool resets=true}){
    if(resets){
      reset();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WatchShape(builder: (context,shape,child){
        return 
           Container(
            child: Center(
              child: Column(
                children: [
                  Text("StopWatch"),
                  SizedBox(height: 50,),
                  buildTime(),
                  SizedBox(height: 10,),
                buildButton(),]),
            ));
        
      },
      child: AmbientMode(builder: (context,mode,child){
        return Text("Ambient Mode");
      },),),
    );
  }

  Widget buildTime(){
    String twoDigits(int n)=> n.toString().padLeft(2,'0');
    final minutes=twoDigits(duration.inMinutes.remainder(60));
    final seconds=twoDigits(duration.inSeconds.remainder(60));
    final hours=twoDigits(duration.inHours.remainder(24));
    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(fontSize: 20,),
    );
  }
  
  Widget buildButton(){
    final isRunning= timer==null?false:timer!.isActive;

    return isRunning?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: (){
            stopTimer(resets: false);
          },child: Icon(Icons.pause, color: Colors.deepPurpleAccent,),),
          SizedBox(width: 5,),
          TextButton(onPressed: (){
            stopTimer(resets: true);
          }, child: Icon(Icons.refresh,color: Colors.limeAccent,),)
        ],
      )
      :TextButton(onPressed: (){
        startTimer();
      }, child: Icon(Icons.play_arrow, color: Colors.lime,),);
  }

}
