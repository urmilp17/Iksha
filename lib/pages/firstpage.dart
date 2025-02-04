import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Other%20Modules/bookpdf.dart';
import 'package:iksha/pages/Sadhana/Discrimination.dart';
import 'package:iksha/pages/Sadhana/Non-attachment.dart';
import 'package:iksha/pages/Sadhana/Six-virtues.dart';
import 'package:iksha/pages/Sadhana/Longing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iksha/pages/Other%20Modules/trigunas.dart';
import 'package:iksha/pages/sampradayas/sampradaya1.dart';
import 'package:iksha/pages/sampradayas/sampradaya2.dart';
import 'package:iksha/pages/sampradayas/sampradaya3.dart';
import 'package:iksha/pages/sampradayas/sampradaya4.dart';
import 'package:iksha/pages/sampradayas/sampradaya5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iksha/pages/Other%20Modules/videofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import '../internet_service.dart';
import '../localeprovider.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//swallow you whole
class _HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String? userName;
  String? profileurl;
  File? _selectedImage;
  final Random random = Random();
  final picker = ImagePicker();

  int _current = 0; // Track the index of the current slide
  String sanskritText = "";
  String translationText = "";

  @override
  void initState() {
    super.initState();
    // fetchUserName();
    fetchUserProfile();
    fetchSubhashita();
  }

  // Future<void> fetchUserName() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       final snapshot = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .get();
  //       if (snapshot.exists) {
  //         setState(() {
  //           userName = snapshot['name'];
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     print("Error fetching user name: $e");
  //   }
  // }

  void fetchSubhashita() async {
    try {
      // Fetch all documents from the 'subhashita' collection
      final collection = FirebaseFirestore.instance.collection('subhashita');
      final querySnapshot = await collection.get();

      if (querySnapshot.docs.isNotEmpty) {
        const int lowerBound = 0; // Inclusive lower bound
        const int upperBound = 10; // Exclusive upper bound
        final int randomIndex =
            lowerBound + Random().nextInt(upperBound - lowerBound);
        // Select a random document
        final data = querySnapshot.docs[randomIndex].data();

        setState(() {
          sanskritText = data['sanskrit'] ?? "Sanskrit text not available";
          translationText = data['translation'] ?? "Translation not available";
        });
      }
    } catch (e) {
      setState(() {
        sanskritText =
            "हिमालयं समारभ्य यावत् इंदु सरोवरम् ।\nतं देवनिर्मितं देशं हिंदुस्थानं प्रचक्षते ॥";
        translationText =
            "Starting from Himalayas and extending up to the Indu Lake (sarovaram), which borders on the Indian Ocean, is the nation which God created and which is known as 'Hindusthan'. ";
      });
    }
  }

  Future<void> fetchUserProfile() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (snapshot.exists) {
          setState(() {
            profileurl =
                snapshot['imageUrl'] ?? ''; // Safeguard against null values
          });
        } else {
          print('No user data found for UID: ${user.uid}');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print("Error fetching user profile: $e");
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

  bool loading = false;

  void showUpdateProfileDialog(BuildContext context,
      TextEditingController nameController, String profileUrl) {

    showDialog(
      context: context,
      builder: (context) {
        final localizations = AppLocalizations.of(context);
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: const EdgeInsets.all(20),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile Image
                    GestureDetector(
                      onTap: () async {
                        await selectImage(context);
                        setState(
                            () {}); // Update state to reflect the new image
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : (profileUrl.isNotEmpty
                                ? NetworkImage(profileUrl)
                                : const AssetImage(
                                    "assets/images/Logo.png")) as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      localizations?.pfp??"Update Profile Photo",
                      style: const TextStyle(fontFamily: 'Eczar', fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Username Field
                    TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Eczar'),
                      decoration:  InputDecoration(
                        hintText: localizations?.name ??'Enter new username',
                        hintStyle: const TextStyle(fontFamily: 'Eczar'),
                        errorStyle: const TextStyle(fontFamily: 'Eczar'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return localizations?.pls_uname ??'Please enter a username';
                        }
                        if (value.length > 10) {
                          return localizations?.uname_len ?? 'Username must not exceed 10 characters';
                        }
                        if (value.contains(' ')) {
                          return localizations?.uname_w_1 ??'Username must not have space';
                        }
                        if (value.startsWith('.') ||
                            value.startsWith('!') ||
                            value.startsWith('/') ||
                            value.startsWith(r'\') ||
                            value.startsWith(r'$') ||
                            RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?~`]$').hasMatch(value)) {
                          return localizations?.uname_w_2 ??'Username cannot start or end with a symbol.';
                        }
                        if (value.contains(RegExp(r'[A-Z]'))) {
                          return localizations?.uname_w_3 ??'Username must not contain uppercase letters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Save Button
                    ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                                content: Text(localizations?.pls_uname ??'Username cannot be empty')),
                          );
                          return;
                        }

                        // Check if username is unique
                        bool isUnique =
                            await isUsernameUnique(nameController.text);
                        if (!isUnique) {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                                content: Text(localizations?.uname_exists ??'Username already exists')),
                          );
                          return;
                        }

                        // Update profile in Firebase
                        setState(() => loading = true);
                        try {
                          String? imageUrl = profileUrl;

                          if (_selectedImage != null) {
                            // Upload image to Cloud Storage
                            final storageRef = FirebaseStorage.instance.ref().child(
                                'user_avatar/${FirebaseAuth.instance.currentUser!.email}');
                            await storageRef.putFile(_selectedImage!);
                            imageUrl = await storageRef.getDownloadURL();
                          }

                          // Update user document in Firestore
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            'name': nameController.text,
                            'imageUrl': imageUrl,
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                                content: Text(localizations?.pfp_updated ??'Profile updated successfully')),
                          );

                          Navigator.pop(context);
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Failed to update profile: $error')),
                          );
                        } finally {
                          setState(() => loading = false);
                        }
                      },
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          :  Text(
                        localizations?.save ??"Save",
                              style: const TextStyle(
                                  fontFamily: 'Eczar', color: Colors.black),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider.setLocale(locale);
    Navigator.pop(context); // Close the dialog after selection
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final user = FirebaseAuth.instance.currentUser;
    Stream<DocumentSnapshot> userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid ?? "")
        .snapshots();
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
    final List<Widget> imageSliders = [
      buildCarouselItem('assets/images/sp1.jpg',
          localizations?.shaivism ?? 'Shaivism', context, const Sampradaya1()),
      buildCarouselItem('assets/images/sp2.jpg',
          localizations?.shaktism ?? 'Shaktism', context, const Sampradaya2()),
      buildCarouselItem(
          'assets/images/sp3.jpg',
          localizations?.vaishnav ?? 'Vaishnavism',
          context,
          const Sampradaya3()),
      buildCarouselItem('assets/images/sp4.jpg',
          localizations?.ganpatya ?? 'Ganpatya', context, const Sampradaya4()),
      buildCarouselItem(
          'assets/images/sp5.jpg',
          localizations?.smarthism ?? 'Smarthism',
          context,
          const Sampradaya5()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60, // Slightly reduced height
        title: Padding(
          padding: const EdgeInsets.only(top: 10), // Adjusted padding
          child: isConnectedToInternet
              ? StreamBuilder<DocumentSnapshot>(
                  stream: userStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Center(
                        child: Text(
                          "User not found",
                          style: TextStyle(fontFamily: "Eczar"),
                        ),
                      );
                    }

                    var userData = snapshot.data!;
                    String userName = userData['username'] ?? 'Unknown';
                    String profileUrl = userData['imageUrl'] ?? '';
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations?.hey_user(userName) ??
                                  "Hey, $userName 👋",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Eczar"),
                            ),
                            Text(
                              localizations?.welcome_message ??
                                  "Welcome to Iksha",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "Eczar"),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            TextEditingController nameController =
                                TextEditingController(text: userName);
                            showUpdateProfileDialog(
                              context,
                              nameController,
                              profileUrl,
                            );
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: profileUrl.isNotEmpty
                                ? NetworkImage(profileUrl)
                                : const AssetImage("assets/images/Logo.png")
                                    as ImageProvider,
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Row(
                  children: [
                    Icon(
                      Icons.warning,
                      size: 18,
                      color: iconcolor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                     Text(
                      localizations?.internet ??"No Internet",
                      style: const TextStyle(fontFamily: "Eczar"),
                    ),
                  ],
                ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async {
                  final auth = FirebaseAuth.instance;
                  await auth.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: Text(
                  localizations?.logout ?? 'Logout',
                  style: const TextStyle(fontFamily: 'Eczar'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            localizations?.select_lang ?? 'Select Language',
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
                                  _changeLanguage(context, const Locale('en'));
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'हिंदी (Hindi)',
                                  style: TextStyle(fontFamily: "Eczar"),
                                ),
                                onTap: () {
                                  _changeLanguage(context, const Locale('hi'));
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
                  localizations?.swtich_language ?? 'Switch Language',
                  style: const TextStyle(fontFamily: 'Eczar'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            16.5, 10, 16.5, 0), // Adjusted top padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  fetchSubhashita();
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: isConnectedToInternet
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                sanskritText.replaceAll("\\n", "\n"),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Yatra", fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                translationText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Eczar", fontSize: 14),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 18,
                                color: iconcolor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                localizations?.internet ??"No Internet",
                                style: const TextStyle(fontFamily: "Eczar"),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              buildSectionTitle(
                  localizations?.sampradayas_title ?? "Sampradayas"),
              Text(
                localizations?.sampradayas_description ??
                    "According to Gita 4.2, Sampradayas (spiritual lineages) preserve and transmit sacred knowledge, "
                        "ensuring its authenticity and continuity, thereby guiding seekers on the path to self-realization.",
                style: const TextStyle(fontFamily: 'Eczar', height: 1.6),
              ),
              const SizedBox(height: 10), // Reduced space
              CarouselSlider(
                items: imageSliders,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index; // Update the current index
                    });
                  },
                ),
              ),
              const SizedBox(height: 10), // Reduced space
              // Add dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              buildSectionTitle(
                  localizations?.sadhana_title ?? "Sadhana Chatusthaya"),
              Text(
                localizations?.sadhana_description ??
                    'Sadhana Chatushtaya provides a foundation \nfor spiritual growth, '
                        'enabling seekers to discern \nreality, detach from worldly desires, '
                        'cultivate self-control, and intensely yearn for liberation,\nleading to Self-realization.',
                style: const TextStyle(fontFamily: 'Eczar', height: 1.6),
              ),
              buildHorizontalList([
                buildSmallCard(
                    context,
                    "assets/images/viveka.jpg",
                    r"{ddoH$",
                    localizations?.discrimination ?? "DISCRIMINATION",
                    const Viveka()),
                buildSmallCard(
                    context,
                    "assets/images/vairagya.jpg",
                    "d¡am½`",
                    localizations?.dispassion ?? "DISPASSION",
                    const Vairagya()),
                buildSmallCard(
                    context,
                    "assets/images/shad sampatii.jpg",
                    "eX-g§nÎmr",
                    localizations?.shad_sampati ?? "SIX VIRTUES",
                    const ShadSampati()),
                buildSmallCard(
                    context,
                    "assets/images/mumukshatva.jpg",
                    "_w_wjwËd§",
                    localizations?.mumukshutva ?? "LONGING",
                    const Mumukshatva()),
              ]),
              const SizedBox(height: 20),
              buildExploreSection(context), // Updated Explore section
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselItem(
    String file,
    String text,
    BuildContext context,
    StatelessWidget widget,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SwipeablePageRoute(
            builder: (_) => widget,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(file),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Eczar',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Eczar'),
      ),
    );
  }

  Widget buildHorizontalList(List<Widget> cards) {
    return SizedBox(
      height: 160, // Increased height for the card
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }

  Widget buildSmallCard(BuildContext context, String image, String hindiText,
      String englishText, StatelessWidget pagewidget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SwipeablePageRoute(
            builder: (_) => pagewidget,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 12, 5, 7),
        child: Container(
          width: 180,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 7), // Add spacing above the avatar
              CircleAvatar(
                radius: 33, // Set the desired radius for the avatar
                backgroundImage: AssetImage(image),
              ),
              //const SizedBox(height: 8),
              Text(
                hindiText,
                style: const TextStyle(
                    fontSize: 30, color: Colors.black, fontFamily: 'DevaHead'),
              ),
              const SizedBox(height: 2),
              Text(
                englishText,
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExploreSection(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle(localizations?.explore ?? "Explore"),
        const SizedBox(height: 15),
        buildExploreCard(
          context,
          icon: Icons.play_circle_filled,
          title: localizations?.video_recommendation ?? "Video Recommendation",
          description: localizations?.video_recommendation_description ??
              "Explore a curated selection \nof videos on various topics.",
          color: Colors.amberAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) => VideoPage(),
              ),
            );
          },
        ),
        const SizedBox(height: 10), // Reduced space between cards
        buildExploreCard(
          context,
          icon: Icons.auto_stories,
          title: localizations?.books_to_read ?? "Books to Read",
          description: localizations?.books_to_read_description ??
              "Recommended reading materials for your growth.",
          color: Colors.greenAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) =>
                    BookDetailsPage(), // Keep 'const' since the class is const
              ),
            );
          },
        ),

        const SizedBox(height: 10), // Reduced space between cards
        buildExploreCard(
          context,
          icon: Icons.book,
          title: localizations?.trigunas ?? "Trigunas",
          description: localizations?.trigunas_description ??
              "Understanding the three gunas in daily life.",
          color: Colors.lightBlueAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) => const Trigunas(),
              ),
            );
          },
        ),
        const SizedBox(height: 100), // Added space below the Trigunas card
      ],
    );
  }

  Widget buildExploreCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.all(12), // Reduced padding to fit content better
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Eczar"),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.grey, fontFamily: "Eczar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
