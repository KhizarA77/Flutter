import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorMsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Text Field"),
      ),
      body:  Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
            maxLength: 10,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
                labelText: 'Password',
                counter: Text('1/2'),
                errorText: _errorMsg
              ),
            obscureText: false,
            autocorrect: true,
            autofocus: true,
            cursorColor: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _errorMsg  = null;
        });
      }),
    );
  }
}