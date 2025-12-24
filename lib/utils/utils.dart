import 'dart:convert';
import 'dart:io';
myPrint(Object? value){
      print('==========================================');
      print(value);
      print('==========================================');
}




Future<String> imageToBase64(File imgFile) async {
  final bytes = await imgFile.readAsBytes();
  return base64Encode(bytes);
}
