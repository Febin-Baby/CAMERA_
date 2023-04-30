import 'dart:io';

import 'package:camera_app/screens/imageModel.dart';
import 'package:camera_app/screens/list22.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? _image;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  Future <void> pickImage() async{
    var _image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(_image == null) return;

    final imageTemporary = File(_image.path);
    final data = ImageModel(img: imageTemporary);
    addImage(data);
    setState(() => _image = imageTemporary as XFile?);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),

            _image!=null ? Image.file(_image!,width: 100,height: 100,fit: BoxFit.cover,) : Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTButhu9abJbym7EsOI8xIQSlhtd_r6bUrUw&usqp=CAU'),

            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                pickImage();
              }, 
              child: const Text('Camera'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: ((context)=>const ListCam()),
                  ),
                );
              }, 
              child: const Text('Gallery '),
            ),  
          ],
        ),
      ),
    );
  }
}