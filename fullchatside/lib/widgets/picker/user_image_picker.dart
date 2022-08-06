import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  // final ImagePicker _picker = ImagePicker();
  final picker = ImagePicker();
  // File? _pickedImage;

  File? imagePicked;
  void cameraImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      imagePicked = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void gallaryImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      imagePicked = pickedImageFile;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          child: CircleAvatar(
            radius: 71,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 69,
              backgroundImage: imagePicked == null
                  ? null
                  : FileImage(
                      imagePicked!,
                    ),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 40,
          // bottom: 3,
          child: Row(
            children: [
              RawMaterialButton(
                fillColor: Theme.of(context).backgroundColor,
                padding: const EdgeInsets.all(10),
                shape: const CircleBorder(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Choose Option',
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton.icon(
                                onPressed: cameraImage,
                                label: const Text(
                                  'Go to my Camera',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.camera,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: gallaryImage,
                                label: const Text(
                                  'Go to My Gallery',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                icon: const Icon(Icons.image),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.add_a_photo,
                  size: 48,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
