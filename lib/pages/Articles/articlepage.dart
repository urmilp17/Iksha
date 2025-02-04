import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/internet_service.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'articlemodal.dart';
import 'articletile.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {

  int currentPage = 1;
  bool hasLoopedToFirstPage = false;
  final TextEditingController _searchController = TextEditingController();// Tracks whether we looped back to the first page
  List<Article> displayedArticles = [];
  bool isLoading = false;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadInitialArticles();
  }

  Future<List<Article>> fetchPaginatedArticles({required int startAfter}) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('article')
          .orderBy('articleNo') // Order by the articleNo field
          .startAfter([startAfter]) // Start fetching after the last article number
          .get();

      return snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching paginated articles: $e');
      return [];
    }
  }

  Future<void> _loadInitialArticles() async {
    setState(() {
      isLoading = true;
    });

    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('article')
          .orderBy('articleNo') // Order by articleNo
          .get();

      setState(() {
        displayedArticles = snapshot.docs
            .map((doc) => Article.fromFirestore(doc))
            .toList();
        currentPage = 1; // Reset page count
      });
    } catch (e) {
      print('Error loading initial articles: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<List<Article>> fetchArticles() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('article')
          .get();

      return snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }


  Future<void> _loadArticles() async {
    setState(() => isLoading = true);

    try {
      QuerySnapshot snapshot;
      if (searchQuery.isEmpty) {
        snapshot = await FirebaseFirestore.instance
            .collection('article')
            .orderBy('articleNo')
            .get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection('article')
            .get();
      }

      setState(() {
        displayedArticles = snapshot.docs
            .map((doc) => Article.fromFirestore(doc))
            .where((article) => article.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            article.titleHindi.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
      });
    } catch (e) {
      print('Error loading articles: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
    return isConnectedToInternet ? Scaffold(
      appBar: AppBar(
        title: const Text('Articles',style: TextStyle(
            fontFamily: "Eczar", fontSize: 28, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: background,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                    _loadArticles();
                  },
                  style: const TextStyle(fontFamily: "Eczar"),
                  decoration: InputDecoration(
                    hintText: 'Search articles...',
                    prefixIcon: Icon(Icons.search,color: iconcolor,),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : displayedArticles.isEmpty
                ? const Center(
              child: Text('No articles found',style: TextStyle(fontFamily: "Eczar"),),
            )
                : ListView.builder(
              itemCount: displayedArticles.length,
              itemBuilder: (context, index) {
                return ArtiTitle(article: displayedArticles[index]);
              },
            ),
          ),
        ],
      ),
    ):Scaffold(
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
             Text(
              localizations?.no_internet??'No Wifi or Cellular Data',
              style: const TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              localizations?.no_articles??'Unable to load articles.\nPlease check your connection and try again.',
              textAlign: TextAlign.center,
              style: const TextStyle(
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
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
    );
  }
}

class ArtiTitle extends StatelessWidget {
  const ArtiTitle({
    super.key,
    required this.article,
  });

  final Article article;

  Future<void> _incrementViewCount(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final articleRef =
    FirebaseFirestore.instance.collection('article').doc(article.id);

    final snapshot = await articleRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    if (data['viewedBy'] != null &&
        (data['viewedBy'] as List).contains(user.uid)) {
      return;
    }

    await articleRef.update({
      'views': FieldValue.increment(1),
      'viewedBy': FieldValue.arrayUnion([user.uid]),
    });
  }

  Future<void> _toggleLike(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final articleRef =
    FirebaseFirestore.instance.collection('article').doc(article.id);

    final snapshot = await articleRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    final likedBy = data['likedBy'] ?? [];
    if ((likedBy as List).contains(user.uid)) {
      await articleRef.update({
        'likes': FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([user.uid]),
      });
    } else {
      await articleRef.update({
        'likes': FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([user.uid]),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final currentLocale = Localizations.localeOf(context).languageCode;
    String getText(String locale, String engText, String hindText) {
      return locale == 'hi' ? hindText : engText;
    }

    return GestureDetector(
      onTap: () async {
        await _incrementViewCount(context);

        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ArticleDetailPage(article: article),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Start from right
              const end = Offset.zero; // End at original position
              const curve = Curves.easeInToLinear;

              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(article.photoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              getText(currentLocale, article.title, article.titleHindi),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Eczar"),
            ),
            const SizedBox(height: 8),
            Text(
              getText(currentLocale, article.content, article.contentHindi).replaceAll("\\n", "\n"),
              style: const TextStyle(
                  fontSize: 12, color: Colors.black87, fontFamily: "Eczar"),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // First Row: Date, Views, Likes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      getText(currentLocale, article.date, article.dateHindi),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Eczar"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      article.views.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Eczar"),
                    ),
                    const SizedBox(width: 12),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('article')
                          .doc(article.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || user == null) {
                          return Row(
                            children: [
                              const Icon(Icons.thumb_up,
                                  size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                article.likes.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: "Eczar"),
                              ),
                            ],
                          );
                        }

                        final data =
                        snapshot.data?.data() as Map<String, dynamic>;
                        final likedBy = data['likedBy'] ?? [];
                        final isLiked = (likedBy as List).contains(user.uid);

                        return GestureDetector(
                          onTap: () => _toggleLike(context),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 16,
                                color: isLiked ? Colors.blue : Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                data['likes'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: "Eczar"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
