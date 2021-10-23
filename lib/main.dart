import 'package:conversor/modules/conversor/controllers/conversor_controller.dart';
import 'package:conversor/modules/conversor/pages/page_conversor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(
            color: Colors.amber
          ),
          enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )
        
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("\$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        titleTextStyle: const TextStyle(
          color:  Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
      ),

      body: const ConversorPage(),
    );
  }
}