import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iti_project/core/constants/app_colors.dart';

class ProfileImagePicker extends StatefulWidget {
  final File? image;
  final Function(File) onImagePicked;
  final String deafultImage;

  const ProfileImagePicker({
    super.key,
    this.image,
    required this.onImagePicked,
    required this.deafultImage,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    pickedImage = widget.image;
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        pickedImage = file;
      });
      widget.onImagePicked(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 90,
            backgroundImage:
                pickedImage != null
                    ? FileImage(pickedImage!)
                    : NetworkImage(widget.deafultImage),
          ),
          Positioned(
            bottom: 135,
            right: MediaQuery.of(context).size.width * 0.01,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
