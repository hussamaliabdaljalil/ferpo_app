// import 'dart:io';
// import 'package:ferpo/favorite/pages/photo_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});
//
//   @override
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   File? _imageFile;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       final directory = await getApplicationDocumentsDirectory();
//       final savedImage = File('${directory.path}/saved_image.jpg');
//       await File(image.path).copy(savedImage.path);
//
//       setState(() {
//         _imageFile = savedImage;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اختيار صورة'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imageFile != null)
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ZoomableImageScreen(
//                         imagePath: _imageFile!.path,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Image.file(
//                   _imageFile!,
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             else
//               const Text('لم يتم اختيار صورة بعد'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('اختر صورة من المعرض'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
