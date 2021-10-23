import 'package:flutter/material.dart';

class GetDataMessage extends StatelessWidget {
  const GetDataMessage({ 
    Key? key, 
    required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.amber,
        ),
      ),
    );
  }
}