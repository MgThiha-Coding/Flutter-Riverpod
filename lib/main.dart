import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/screens/home.dart';

void main()=> runApp(  
   ProviderScope(child: Riverpod())
);
class Riverpod extends StatelessWidget {
  const Riverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
       home: Home(),
    );
  }
}