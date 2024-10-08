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
  List<Post> _post = [];
  bool _isLoading = true;


  Future<void> fetchAllPosts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final response = await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        _post = jsonResponse.map((post) => Post.fromJson(post)).toList();
      }
    } catch (e) {
      throw Exception('Failed to load post');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: _post.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_post[index].title),
                    subtitle: Text(_post[index].content),
                    leading: Image.network(_post[index].image),
                  );
                },
              ),
      ),
    );
  }
}
