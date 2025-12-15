import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/utils/util.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key, required this.user}) {
    controllers[0].text = user.name;
    controllers[1].text = user.email;
    controllers[2].text = '************';
  }
  final User user;
  final List<TextEditingController> controllers = List.generate(
    3,
    (index) => TextEditingController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),

            _buildUserImage(imgUrl: user.imgUrl),

            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Personal info'),
                TextButton(
                  onPressed: () {
                    context.push(Routes.changePersonalInfo, extra: user);
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
    );
  }
}

class _buildUserImage extends StatefulWidget {
  const _buildUserImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  State<_buildUserImage> createState() => _buildUserImageState();
}

class _buildUserImageState extends State<_buildUserImage> {

  File? imgFile;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,

      child: GestureDetector(
        onTap: () {
          _pickImage();
        },
        child: SizedBox(
          height: 70,
          child: CircleAvatar(
            radius: 45,
            child:(imgFile != null) ? Image.file(imgFile!) :
                (widget.imgUrl.isNotEmpty)
                    ? Image.network(widget.imgUrl)
                    : Image.asset(getIconPath("user_icon.png")),
          ),
        ),
      ),
    );
  }

void _pickImage() async {
  final ImagePicker picker = ImagePicker();
// Pick an image.

try{
 final XFile? img = await picker.pickImage(source: ImageSource.gallery);
  if (img != null) {
      setState(() {
     imgFile = File(img.path);
        
      });
  }
}catch(e){
  print(e);
}
 
}
}

