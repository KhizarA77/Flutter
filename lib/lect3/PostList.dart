import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:namer_app/lect3/list_api.dart';

class CustomPostList extends StatefulWidget {
  const CustomPostList({super.key});

  @override
  State<CustomPostList> createState() => _CustomPostListState();
}

class _CustomPostListState extends State<CustomPostList> {

  Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchAllPosts(),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text((snap.data as List<Post>)[index].title),
                    subtitle: Text((snap.data as List<Post>)[index].content),
                    leading: Image.network(
                      (snap.data as List<Post>)[index].image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),

                  );
                },
              );
            } else if (snap.hasError) {
              return Text('Error in fetch');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}