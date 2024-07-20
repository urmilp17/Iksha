import 'package:flutter/material.dart';
import 'package:iksha/home.dart';
import 'package:iksha/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 100),
                  Text("Login", style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 7),
                  const Text('Please enter email and password to get started.'),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
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
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  loading? const Center(child: CircularProgressIndicator(),):
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        startLogin();
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Register()));
          },
          child: const Text("New User ? Register"),
        ),
      ],
    ));
  }

  startLogin() async {
    try{
    await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
    setState(() {
      loading = false;
    });
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MyHomePage()), (route) => false);

    } on FirebaseAuthException catch(e){
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "")));
      print(e.message);
    }
  }
}
