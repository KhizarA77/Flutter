import 'package:flutter/material.dart';
import 'package:namer_app/lect3/list_api.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: const MyApp(),
    )
  );
}

class Counter with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void fetchPost() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      _posts = jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load post');
    }
    _isLoading = false;
    notifyListeners();
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Check',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example App'),
        ),
        body: context.watch<Counter>().isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: context.watch<Counter>().posts.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(context.watch<Counter>().posts[index].title),
            subtitle: Text(context.watch<Counter>().posts[index].content),
            leading: Image.network(
              context.watch<Counter>().posts[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ), 
        floatingActionButton: FloatingActionButton(
          key: const Key('increment_floatingActionButton'),
          onPressed: () {
            context.read<Counter>().changeLoading();
            context.read<Counter>().fetchPost();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}