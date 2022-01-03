import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Widget to capture and crop the image
class ImageUpload extends StatefulWidget {
  const ImageUpload({ Key? key }) : super(key: key);

  @override
  ImageUploadState createState() => ImageUploadState();
}

class ImageUploadState extends State<ImageUpload> {
/*   File _imageFile;
  bool _isUploading;
  String _uploadedFileURL; */
  String imageUrl = "";
  // Map data = {};
  String docid = '';

  @override

  Widget build(BuildContext context) {
    
    docid = ModalRoute.of(context)!.settings.arguments as String;
    // docid = data['docid'];



    return Scaffold(
        appBar: AppBar(
          title: const Text("Upload Image"),
          ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (imageUrl != "")
                  ? Image.network(imageUrl)
                  : const Text('No image selected.'),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Pick an image'),
                onPressed: ()=>uploadImage()
              ),
            ],
          ),
        ),
        );
  }


/*   uploadImage() async{
    final _storage = FirebaseStorage.instance;
    await Permission.photos.request();
    final _picker = ImagePicker();
    PickedFile? image; 

    var permissionStatus = await Permission.photos.status;

    if(permissionStatus.isGranted){
      await _picker.getImage(source: ImageSource.gallery).then((value) {
        image = value;
        var file = File(image.path);

        if (image != null){
        //Upload to Firebase
        var snapshot =_storage.ref()
        .child('folderName/imageName')
        .putFile(file)
        var downloadUrl = snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
        }
        else{
          print("No path recieved");
        }
      });
    }else{
      print("Grant Permission");
    }


  } */
  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile? image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = (await _picker.getImage(source: ImageSource.gallery))!;
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
        .child('folderName/imageName')
        .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });


        FirebaseFirestore.instance.collection('listings')
        .doc(docid)
        .update({'Images': {'link': imageUrl}})
        .then((value) => print("Listing Image Added"))
        .catchError((error) => print("Failed to update listing: $error"));





      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }

    

    
  }


}