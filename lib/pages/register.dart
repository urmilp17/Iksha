import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/pages/login.dart';
import 'package:flutter/gestures.dart';

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
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x6B000000),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: const Color(0xC8FFD79A),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text("Register",
                        style: TextStyle(fontFamily: 'Eczar', fontSize: 45)),
                    const SizedBox(height: 7),
                    const Text(
                      'Please enter name, email and password to get started.',
                      style: TextStyle(fontFamily: 'Eczar'),
                    ),
                    const SizedBox(height: 10),
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
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontFamily: 'Eczar'),
                              hintText: 'Enter your email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(fontFamily: 'Eczar'),
                            ),
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
                                    color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const LoginPage()));
                                  }),
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

  register() async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await result.user?.updateDisplayName(name.text);
      setState(() {
        loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MyHomePage()),
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
