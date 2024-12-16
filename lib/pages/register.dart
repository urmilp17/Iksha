import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iksha/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final _controller = CropController();

  File? _selectedImage;
  String? _imageUrl;
  bool loading = false;
  final picker = ImagePicker();
  final _imageDataList = <Uint8List>[];

  var _currentImage = 0;
  set currentImage(int value) {
    setState(() {
      _currentImage = value;
    });
    _controller.image = _imageDataList[_currentImage];
  }

  Future<Uint8List> _load(String assetName) async {
    final assetData = await rootBundle.load(assetName);
    return assetData.buffer.asUint8List();
  }


  Future<void> selectImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        // Show Snackbar if no file is picked
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please upload a profile picture.'),
            duration: Duration(seconds: 2),
          ),
        );
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 90,),
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x6B000000),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: const Color(0xFFFFF9F2),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text("Register",
                        style: TextStyle(fontFamily: 'Eczar', fontSize: 45)),
                    const SizedBox(height: 7),
                    GestureDetector(
                      onTap: () => selectImage(context),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage:
                        _selectedImage != null ? FileImage(_selectedImage!) : null,
                        child: _selectedImage == null
                            ? const Icon(Icons.add_a_photo, size: 20)
                            : null,
                      ),
                    )
                    ,
                    // const Text(
                    //   'Please enter name, email and password to get started.',
                    //   style: TextStyle(fontFamily: 'Eczar',fontSize: 13),
                    // ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: name,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(fontFamily: 'Eczar'),
                                errorStyle: TextStyle(fontFamily: 'Eczar')),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(fontFamily: 'Eczar'),
                                hintText: 'Enter your email',
                                counterStyle: TextStyle(fontFamily: 'Eczar'),
                                errorStyle: TextStyle(fontFamily: 'Eczar')),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(fontFamily: 'Eczar'),
                                errorStyle: TextStyle(fontFamily: 'Eczar')),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      register();
                                    }
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                            Colors.white),
                                  ),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Eczar'),
                                  ),
                                ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: 'Already Registered ? Login',
                              style: const TextStyle(
                                  fontFamily: 'Eczar',
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          const begin = Offset(2.5, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.ease;

                                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                    ),
                                  );
                                },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }







  Future<void> upload() async {
    if (_selectedImage == null) {
      print('No image selected');
      return;
    }

    try {
      firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref = storage.ref().child("user_avatar/${email.text}"); // Correct path
      firebase_storage.UploadTask uploadTask = ref.putFile(_selectedImage!);

      // Wait for the upload task to complete
      await uploadTask.whenComplete(() async {
        final url = await ref.getDownloadURL();
        setState(() {
          _imageUrl = url;
        });
        print('File uploaded successfully: $url');
      });
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  register() async {
    try {
      await upload();
          final result = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await firestore.collection('users').doc(result.user?.uid).set({
        'name': name.text,
        'email': email.text,
        'imageUrl': _imageUrl,
      });
      setState(() {
        loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const MyHomePage(),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(2.5, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "")));
      print(e.message);
    }
  }
}
