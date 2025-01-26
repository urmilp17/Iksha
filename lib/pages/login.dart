import 'package:flutter/material.dart';
import 'package:iksha/home.dart';
import 'package:iksha/pages/forgotpass.dart';
import 'package:iksha/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import '../internet_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final name = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  bool loading = false;

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
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 90,
                ),
                Container(
                  width: 170,
                  height: 170,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(localizations?.login??"Login",
                              style:
                                  const TextStyle(fontFamily: 'Eczar', fontSize: 45)),
                          const SizedBox(height: 7),
                           Text(
                            localizations?.pls_name_pass ??'Please enter name and password to get started.',
                            style: const TextStyle(fontFamily: 'Eczar'),
                          ),
                          const SizedBox(height: 7),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: name,
                                  style: const TextStyle(fontFamily: "Eczar"),
                                  decoration:  InputDecoration(
                                    hintStyle: const TextStyle(fontFamily: 'Eczar'),
                                    hintText: localizations?.name ?? 'Enter your username',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return localizations?.pls_uname ??'Please enter username';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 7),
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: password,
                                  obscureText: true,
                                  style: const TextStyle(fontFamily: "Eczar"),
                                  decoration:  InputDecoration(
                                    hintStyle: const TextStyle(fontFamily: 'Eczar'),
                                    hintText: localizations?.password??'Enter your password',
                                    errorStyle: const TextStyle(fontFamily: 'Eczar'),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return localizations?.pls_password ??'Please enter password';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 7),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ForgotPasswordPage(),
                                      transitionDuration:
                                      const Duration(milliseconds: 600),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInCubic;

                                        var tween = Tween(
                                            begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  localizations?.for_pass??"Forgot Password",
                                  style: const TextStyle(fontFamily: "Eczar",decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                      startLogin();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll<Color>(
                                              Colors.white)),
                                  child: Text(
                                    localizations?.login??" Login ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Eczar'),
                                  ),
                                ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                                text: localizations?.n_user??'New User ? Register',
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
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const Register(),
                                        transitionDuration:
                                            const Duration(milliseconds: 600),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(0.0, 1.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInCubic;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )):warningInternet;
  }

  startLogin() async {
    try {
      final userSnapshot = await firestore
          .collection('users')
          .where('name', isEqualTo: name.text)
          .get();

      if (userSnapshot.docs.isEmpty) {
        throw FirebaseAuthException(
            message: 'Username does not exist', code: 'username-not-found');
      }

      final email = userSnapshot.docs.first['email'];
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password.text,
      );

      setState(() {
        loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyHomePage(),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(2.5, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
