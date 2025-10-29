import 'package:flutter/material.dart';
import 'package:listview_kullanimi/show_dialog_kullanimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ShowDialogKullanimi(),
        ),
      ),
    );
  }
}
