import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

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

  File? _selectedImage;
  String? _imageUrl;
  bool loading = false;
  final picker = ImagePicker();

  Future<void> selectImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? croppedFile = await _cropImage(File(pickedFile.path));
      setState(() {
        if (croppedFile != null) {
          _selectedImage = croppedFile;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image cropping cancelled.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload a profile picture.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: background,
          toolbarWidgetColor: iconcolor,
          backgroundColor: background,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );
    return croppedFile != null ? File(croppedFile.path) : null;
  }

  Future<bool> isUsernameUnique(String username) async {
    final userDoc = await firestore
        .collection('users')
        .where('name', isEqualTo: username)
        .get();

    return userDoc.docs.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 90),
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
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x6B000000),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: const Color(0xFFFFF9F2),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Register",
                        style: TextStyle(fontFamily: 'Eczar', fontSize: 45),
                      ),
                      const SizedBox(height: 7),
                      GestureDetector(
                        onTap: () => selectImage(context),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: _selectedImage != null
                              ? FileImage(_selectedImage!)
                              : null,
                          child: _selectedImage == null
                              ? const Icon(Icons.add_a_photo, size: 20)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              textAlign: TextAlign.center,
                              controller: name,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontFamily: 'Eczar'),
                              decoration: const InputDecoration(
                                  hintText: 'Enter your name',
                                  hintStyle: TextStyle(fontFamily: 'Eczar'),
                                  errorStyle: TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a username';
                                }
                                if (value.contains(' ')) {
                                  return 'Username must not have space';
                                }
                                if (value.startsWith('.') ||
                                    value.endsWith('.') ||
                                    value.startsWith('!') ||
                                    value.startsWith('/') ||
                                    value.startsWith(r'\') ||
                                    value.startsWith(r'$')) {
                                  return 'Username cannot start or end with a period';
                                }
                                if (value.contains(RegExp(r'[A-Z]'))) {
                                  return 'Username must not contain uppercase letters';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              textAlign: TextAlign.center,
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontFamily: 'Eczar'),
                              decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(fontFamily: 'Eczar'),
                                  errorStyle: TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              textAlign: TextAlign.center,
                              controller: password,
                              obscureText: true,
                              style: const TextStyle(fontFamily: 'Eczar'),
                              decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(fontFamily: 'Eczar'),
                                  errorStyle: TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            loading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });

                                        bool isUnique =
                                            await isUsernameUnique(name.text);
                                        if (!isUnique) {
                                          setState(() {
                                            loading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Username already exists')),
                                          );
                                          return;
                                        }

                                        register();
                                      }
                                    },
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
                                text: 'Already Registered? Login',
                                style: const TextStyle(
                                    fontFamily: 'Eczar',
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
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
      ),
    );
  }

  Future<void> upload() async {
    if (_selectedImage == null) {
      print('No image selected');
      return;
    }

    try {
      firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref =
          storage.ref().child("user_avatar/${email.text}");
      firebase_storage.UploadTask uploadTask = ref.putFile(_selectedImage!);

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

  Future<void> register() async {
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
        MaterialPageRoute(builder: (context) => const MyHomePage()),
        (route) => false,
      );
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
