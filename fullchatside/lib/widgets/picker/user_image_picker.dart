import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final ImagePicker _picker = ImagePicker();
  final picker = ImagePicker();
 late File _pickedImage;
  Future<void> _pickImage() async {
    final XFile? pickedImageFile =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile as File;
    });
  }
//     // Capture a photo
//     final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  // Future pickImage() async {
  //   try {
  //     final imagePicked = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (imagePicked == null) return;
  //     final imageTemp = File(imagePicked.path);
  //     setState(() => this.imagePicked = imageTemp);
  //   } on PlatformException catch (e) {
  //     if (kDebugMode) {
  //       print('Failed to load: $e');
  // }
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
   
         backgroundImage: _pickedImage!=null? FileImage(_pickedImage
          // !=null ? FileImage(_pickedImage): null
          ): null,
          radius: 64,
          child: ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(
              Icons.image,
              color: Colors.green,
            ),
            label: const Text('Upload'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
