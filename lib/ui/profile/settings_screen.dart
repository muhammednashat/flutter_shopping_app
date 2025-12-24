import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/utils/util.dart';
import 'package:shopping_app/utils/utils.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  SettingsScreen({super.key, required this.user});

  final List<TextEditingController> controllers = List.generate(
    3,
    (index) => TextEditingController(),
  );

  final User user;

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late List<TextEditingController> controllers;
  @override
  void initState() {
    controllers = widget.controllers;
    controllers[0].text = widget.user.name;
    controllers[1].text = widget.user.email;
    controllers[2].text = '************';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),

              _buildUserImage(imgUrl: widget.user.imgUrl),

              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal info'),
                  TextButton(
                    onPressed: () {
                      context.push(
                        Routes.changePersonalInfo,
                        extra: widget.user,
                      );
                    },
                    child: Text('change'),
                  ),
                ],
              ),
              CustomTextFormField(
                readOnly: true,
                label: "Full name",
                controller: controllers[0],
              ),
              CustomTextFormField(
                readOnly: true,
                label: "Email",
                controller: controllers[1],
              ),
              SizedBox(height: 24.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Password'),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.changePassword);
                    },
                    child: Text('change'),
                  ),
                ],
              ),

              CustomTextFormField(
                readOnly: true,
                label: "Password",
                controller: controllers[2],
              ),
              SizedBox(height: 24.0),
              Text('Notifications'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery status changes'),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('New arrivals'),
                  Switch(value: false, onChanged: (value) {}),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Sales'),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildUserImage extends ConsumerStatefulWidget {
  const _buildUserImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  ConsumerState<_buildUserImage> createState() => _buildUserImageState();
}

class _buildUserImageState extends ConsumerState<_buildUserImage> {
  File? imgFile;
  bool _isReadyToSave = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: SizedBox(
              height: 70,
              child: CircleAvatar(
                radius: 55,

                child:
                    (imgFile != null)
                        ? Image.file(imgFile!, fit: BoxFit.cover)
                        : (widget.imgUrl.isNotEmpty)
                        ? Image.network(widget.imgUrl)
                        : Image.asset(getIconPath("user_icon.png")),
              ),
            ),
          ),
          if (_isReadyToSave) TextButton(onPressed: () {}, child: Text("Save")),
        ],
      ),
    );
  }

  void _uploadUserImage(String userId) async {
    final imgbase64 = await imageToBase64(imgFile!);
    ref.read(userProfileRepo).uploadUserImage(imgbase64, userId);
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? img = await picker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        setState(() {
          imgFile = File(img.path);
          _isReadyToSave = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
