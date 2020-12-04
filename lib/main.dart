import 'package:flutter/material.dart';
import 'MyApp.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false, 
        theme: ThemeData(         
          primaryColor: Color(0xFF007FFF),  
          accentColor:  Color(0xFF40EDD0),
        ),
        title: 'Navegação', 
        initialRoute: '/pagina1',
        routes:{
          '/pagina1': (context) => MyApp(),
        }         
    ),
  );
}



