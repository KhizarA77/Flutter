import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar({super.key});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network("https://images.pexels.com/photos/26836559/pexels-photo-26836559/free-photo-of-foamy-wave-crashing-onto-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        Image.asset("assets/sea.jpg"),
        ElevatedButton(
          onPressed: (){
            toastification.show(
              context: context,
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              title: Text("Component updates available."),
              description: Text("Component updates available."),
              alignment: Alignment.topLeft,
              autoCloseDuration: const Duration(seconds: 4),
        	      );
          }, child: Text("show")
        ),
      ],
    );
  }
}