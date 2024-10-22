import 'package:flutter/material.dart';
// import 'package:namer_app/lect1/list_view.dart';
import 'package:namer_app/lect3/PostList.dart';
// import 'package:namer_app/lect2/custom_stack.dart';
// import 'package:namer_app/lect1/text_field.dart';
// import 'package:namer_app/lect2/custom_tab.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(),
        useMaterial3: false,
      ),
      home: const CustomPostList(),
    );
  }
}