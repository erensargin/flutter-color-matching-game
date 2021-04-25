import 'package:flutter/material.dart';
import 'package:flutter4/main.dart';

class RouteGenerator {

static Route<dynamic> generateRoute(RouteSettings settings){
  
  final args = settings.arguments;

  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (_)=> MyHomePage());

    case '/second':

      if(args is int){
        return MaterialPageRoute(
          builder: (_) => SecondPage(data: args,)
        );
        
      }
      break;

    case '/third':
      return MaterialPageRoute(builder: (_) => ThirdPage());

  }
}

}