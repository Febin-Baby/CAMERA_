import 'package:camera_app/screens/imageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListCam extends StatefulWidget {
  const ListCam({super.key});

  @override
  State<ListCam> createState() => _ListCamState();
}

class _ListCamState extends State<ListCam> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 228, 226),
      appBar: AppBar(
        title: Text('Album'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 103, 110, 109),
      ),
      body: ValueListenableBuilder(
        valueListenable: imageListNotifier,
        builder: (context, value, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 10, 
              mainAxisSpacing: 10, 
            ),
            itemBuilder: (context, index) {
              final data1 = value[index];
              return Image.file(
                data1.img,
                fit: BoxFit.cover,
              );
            },
            itemCount: value.length,
          );
        },
      ),
      
    );
  }
}