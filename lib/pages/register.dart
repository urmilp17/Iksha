import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/localeprovider.dart';
import 'package:iksha/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../home.dart';
import '../internet_service.dart';

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
  final FocusNode passwordFocusNode = FocusNode();
  bool hideLogo = false;
  bool loading = false;
  File? _selectedImage;
  String? _imageUrl;
  bool _passwordVisible = false;
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

  Future<bool> isEmailUnique(String email) async {
    final userDoc = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return userDoc.docs.isEmpty;
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider.setLocale(locale);
    Navigator.pop(context); // Close the dialog after selection
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    passwordFocusNode.addListener(() {
      setState(() {
        hideLogo = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
    Scaffold getWarning(String locale, Scaffold engWarn, Scaffold hindWarn) {
      return locale == 'hi' ? hindWarn : engWarn;
    }
    final currentLocale = Localizations.localeOf(context).languageCode;
    Scaffold warningInternet = getWarning(
        currentLocale,
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wifi_off, // No connection icon
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No Wifi or Cellular Data',
                  style: TextStyle(
                    fontFamily: 'Eczar',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please check your connection and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Eczar',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final settings = OpenSettingsPlus.shared;
                        if (settings is OpenSettingsPlusAndroid) {
                          settings.wifi();
                        } else if (settings is OpenSettingsPlusIOS) {
                          settings.wifi();
                        } else {
                          throw Exception('Platform not supported');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ), // Exits the app
                      child: const Text(
                        'Settings',
                        style: TextStyle(fontFamily: 'Eczar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wifi_off, // No connection icon
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'वाईफ़ाई या मोबाइल डेटा नहीं है',
                  style: TextStyle(
                    fontFamily: 'Eczar',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'कृपया अपना कनेक्शन जाँचें और पुनः प्रयास करें।',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Eczar',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final settings = OpenSettingsPlus.shared;
                        if (settings is OpenSettingsPlusAndroid) {
                          settings.wifi();
                        } else if (settings is OpenSettingsPlusIOS) {
                          settings.wifi();
                        } else {
                          throw Exception('Platform not supported');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ), // Exits the app
                      child: const Text(
                        'सेटिंग्स',
                        style: TextStyle(fontFamily: 'Eczar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
    return isConnectedToInternet ? Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              localizations?.select_lang ??'Select Language',
                              style: const TextStyle(fontFamily: "Eczar"),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text(
                                    'English',
                                    style: TextStyle(fontFamily: "Eczar"),
                                  ),
                                  onTap: () {
                                    _changeLanguage(
                                        context, const Locale('en'));
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'हिंदी (Hindi)',
                                    style: TextStyle(fontFamily: "Eczar"),
                                  ),
                                  onTap: () {
                                    _changeLanguage(
                                        context, const Locale('hi'));
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    });
                  },
                  child: Text(
                    localizations?.swtich_language ??'Switch Language',
                    style: const TextStyle(fontFamily: 'Eczar',decoration: TextDecoration.underline),
                  ),
                ),
              ),
              const SizedBox(height: 40),
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
                      Text(
                        localizations?.register ?? "Register",
                        style:
                            const TextStyle(fontFamily: 'Eczar', fontSize: 45),
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
                              decoration: InputDecoration(
                                  hintText:
                                      localizations?.name ?? 'Enter your name',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Eczar'),
                                  errorStyle:
                                      const TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return localizations?.pls_uname ??
                                      'Please enter a username';
                                }
                                if (value.length > 10) {
                                  return localizations?.uname_len ?? 'Username must not exceed 10 characters';
                                }
                                if (value.contains(' ')) {
                                  return localizations?.uname_w_1 ??
                                      'Username must not have space';
                                }
                                if (value.startsWith('.') ||
                                    value.endsWith('.') ||
                                    value.startsWith('!') ||
                                    value.startsWith('/') ||
                                    value.startsWith(r'\') ||
                                    value.startsWith(r'$') ||
                                    value.startsWith(r'%') ||
                                    value.startsWith(r'^') ||
                                    value.startsWith(r'&') ||
                                    value.startsWith(r'*') || value.startsWith(r'$')) {
                                  return localizations?.uname_w_2 ??
                                      'Username cannot start or end with a symbols';
                                }
                                if (value.contains(RegExp(r'[A-Z]'))) {
                                  return localizations?.uname_w_3 ??
                                      'Username must not contain uppercase letters';
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
                              decoration: InputDecoration(
                                  hintText: localizations?.email ??
                                      'Enter your email',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Eczar'),
                                  errorStyle:
                                      const TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return localizations?.pls_email ?? 'Please enter your email';
                                } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                                  return localizations?.vld_email ?? 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              textAlign: TextAlign.center,
                              controller: password,
                              obscureText: !_passwordVisible,
                              focusNode: passwordFocusNode,
                              style: const TextStyle(fontFamily: 'Eczar'),
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: iconcolor,
                                      ),
                                  ),

                                  hintText: localizations?.password ??
                                      'Enter your password',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Eczar'),
                                  errorStyle:
                                      const TextStyle(fontFamily: 'Eczar')),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return localizations?.pls_password ??'Please enter password';
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
                                        bool isEmailunique =
                                            await isEmailUnique(email.text);
                                        if (!isUnique) {
                                          setState(() {
                                            loading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                             SnackBar(
                                                content: Text(
                                                    localizations?.uname_exists ??'Username already exists')),
                                          );
                                          return;
                                        }

                                        if (!isEmailunique) {
                                          setState(() {
                                            loading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    localizations?.email_exists ??'Email already exists')),
                                          );
                                          return;
                                        }

                                        register();
                                      }
                                    },
                                    child: Text(
                                      localizations?.register ?? "Register",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Eczar'),
                                    ),
                                  ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: localizations?.al_registered ??
                                    'Already Registered? Login',
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
    ):warningInternet;
  }

  Future<void> upload() async {
    final localizations = AppLocalizations.of(context);
    if (_selectedImage == null) {
       SnackBar(
        content: Text(
          localizations?.no_img ?? "No Image Selected",
          style: const TextStyle(fontFamily: "Eczar"),
        ),
      );
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
    final localizations = AppLocalizations.of(context);
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              localizations?.no_img ?? "No Image Selected",
              style: const TextStyle(fontFamily: "Eczar"),
            ),
          ),
      );
      setState(() {
        loading = false;
      });
      return;
    }
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
