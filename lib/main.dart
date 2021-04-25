import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter4/route_generator.dart';


int counter = 0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{  

Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.blueGrey, 
        appBar: AppBar(
          title: Text('Color Game'),
        ),
        body: Center(
          child: Column(
            
            children: <Widget>[
            
            Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Text('Choose a game type!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
            
            Row(children: [
              
            Container(
              margin: EdgeInsets.all(15),
              child: FlatButton(
                minWidth: 100,
                height: 50,
                child: Text('3x3', style: TextStyle(fontSize: 28),),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second',arguments: 3);
                },
              )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                minWidth: 100,
                height: 50,
                child: Text('4x4', style: TextStyle(fontSize: 28),),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second',arguments: 4);
                },
              )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                minWidth: 100,
                height: 50,
                child: Text('5x5', style: TextStyle(fontSize: 28),),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second',arguments: 5);
                },
              )
            ),
            ],)
          ],),
        ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.data}) : super(key: key);

  final int data;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

    @override
  void initState() {
    counter=0;
    super.initState();
  }


  void check(int a, int b){
    if (a==b){
      setState(() => counter++);
    }
  }

  @override
  Widget build(BuildContext context){
    final dif = widget.data; 
    List list = List.generate(dif*dif, (i) => i);
    list = shuffle(list);

    
    final colorss = [
    Colors.green,Colors.black,Colors.blue,
    Colors.brown,Colors.orange,Colors.pink,
    Colors.grey,Colors.teal,Colors.cyanAccent,
    Colors.yellow,Colors.brown[900],Colors.deepPurpleAccent,
    Colors.indigo,Colors.lime,Colors.deepOrangeAccent,
    Colors.lightGreen,Colors.pinkAccent,Colors.limeAccent,
    Colors.green[900],Colors.blue[900],Colors.pink[900],
    Colors.yellow[800],Colors.cyan,Colors.red,Colors.redAccent];
    
     
    Random random = new Random();
    int randomNumber = random.nextInt(dif*dif);

    


    return Scaffold(
      backgroundColor: Colors.green[100],
    body:
    Container(
      margin: const EdgeInsets.only(top: 50.0),
      child:GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 5,
    mainAxisSpacing: 10,
    crossAxisCount: dif,
    children: <Widget>[
      Align(
        alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
        child: Text("Score: "+counter.toString()),
        ),
      Align(
        alignment: Alignment.centerRight, // Align however you like (i.e .centerRight, centerLeft)
        child: Text("Next:",textScaleFactor: 2,),
        ),
      Container(color: colorss[list[randomNumber]],),
      OtpTimer(),
      Text(""),
      Text(""),
      if(dif==4 || dif == 5) Text(""),
      if(dif==4 || dif == 5) Text(""),
      if(dif==5) Text(""),
      if(dif==5) Text(""),

      FlatButton(
        child: const Text(''),
        //padding: const EdgeInsets.all(8),
        color: colorss[list[0]],
        onPressed: () => {
          check(0, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[1]],
        onPressed: () => {
            check(1, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[2]],
        onPressed: () => {
            check(2, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[3]],
        onPressed: () => {
            check(3, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[4]],
        onPressed: () => {
            check(4, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[5]],
        onPressed: () => {
            check(5, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[6]],
        onPressed: () => {
            check(6, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[7]],
        onPressed: () => {
            check(7, randomNumber)
        },
      ),
      FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[8]],
        onPressed: () => {
            check(8, randomNumber)
        },
      ),

      if(dif==4 || dif ==5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[9]],
        onPressed: () => {
            check(9, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[10]],
        onPressed: () => {
            check(10, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[11]],
        onPressed: () => {
            check(11, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[12]],
        onPressed: () => {
            check(12, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[13]],
        onPressed: () => {
            check(13, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[14]],
        onPressed: () => {
            check(14, randomNumber)
        },
      ),

      if(dif==4 || dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[15]],
        onPressed: () => {
            check(15, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[16]],
        onPressed: () => {
            check(16, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[17]],
        onPressed: () => {
            check(17, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[18]],
        onPressed: () => {
            check(18, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[19]],
        onPressed: () => {
            check(19, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[20]],
        onPressed: () => {
            check(20, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[21]],
        onPressed: () => {
            check(21, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[22]],
        onPressed: () => {
            check(22, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[23]],
        onPressed: () => {
            check(23, randomNumber)
        },
      ),
      if(dif == 5) FlatButton(
        child: const Text(''),
        padding: const EdgeInsets.all(8),
        color: colorss[list[24]],
        onPressed: () => {
            check(24, randomNumber)
        },
      ),
      

    ],
  ) ,)
    
    );
  }
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {

    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}


class ThirdPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(child:Column(children: [
          Container(child: Text(" GAME OVER !!!\nYour Score is: "+ counter.toString(),textScaleFactor: 2.5,),margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),),
          Container(child:FlatButton(onPressed: (){
            Navigator.of(context).pushNamed('/');
          }, child: Text("Restart"), color: Colors.orange,) ,)
          
          
        ], ))
    );
  }

}


class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {timer.cancel();
        Navigator.of(context).pushNamed('/third');}
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.timer),
        SizedBox(
          width: 3,
        ),
        Text(timerText)
      ],
    );
  }
}