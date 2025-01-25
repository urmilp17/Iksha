import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/internet_service.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      "title": "Drig Drishya Viveka",
      "thumbnail":
          "https://i.ytimg.com/vi/Bxvc4eL3tag/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYZSBOKD8wDw==&rs=AOn4CLBnhkZ3MTyczTL1ZWLlDohsAxHeRQ",
      "subtitle":
          "Dṛg-Dṛśya-Viveka is a text in Advaita Vedanta philosophy that explores the distinction between the “seer” (Dṛg) and the “seen” (Dṛśya)",
      "url":
          "https://youtube.com/playlist?list=PLDqahtm2vA728mT-GFH6F-vN2YsS1h72x&feature=shared"
    },
    {
      "title": "Shad-darshanas",
      "thumbnail":
          "https://i.ytimg.com/vi/Y4EAoWru8Kc/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB8xxDfucLYhUMTaxR-b5v-ySR1xA",
      "subtitle": "Six Approaches to Reality",
      "url":
          "https://youtube.com/playlist?list=PLWjpkY4mU2RDezmqRmC7q0dxqSm2XZj11&feature=shared"
    },
    {
      "title": "Tattvabodha",
      "thumbnail":
          "https://i.ytimg.com/vi/v5gffvRjtiU/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBKE3lrU5NZfyyHaKFnKrfOJ-Xx-w",
      "subtitle": "Tattvabodha is a foundational text in Advaita Vedanta",
      "url":
          "https://youtube.com/playlist?list=PLWjpkY4mU2RDCG1ODP1T6f7mKb1L69G_-&feature=shared"
    },
    {
      "title": "The Four Yogas",
      "thumbnail":
          "https://i.ytimg.com/vi/n-SUJ0Vwelk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDR0OS94uIphzxvvCS7cFeG0Bv-1A",
      "subtitle":
          "Lectures on the four main paths by which a follower can reach moksha, or liberation. ",
      "url":
          "https://youtube.com/playlist?list=PLDqahtm2vA717IaOZp0s9lZqzwmq-MY5u&feature=shared"
    },
    {
      "title": "Panchadasi by Vidyaranya",
      "thumbnail":
          "https://i.ytimg.com/vi/X872V8LMFNE/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAvi2QiQOacfpdW7wxnpPrREOB92w",
      "subtitle":
          " it explains the nature of Brahman, the Self, Prakriti, Maya, Avidya, Jiva, Prajna, and the five elements.",
      "url":
          "https://youtube.com/playlist?list=PLDqahtm2vA71mxVB2YXXi4J8aYVHXL_bE&feature=shared"
    },
    {
      "title": "Foundations of Self Enquiry",
      "thumbnail":
          "https://i.ytimg.com/vi/kGu9qItLTt8/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA3IZ_4UHAFx-blhkiH69Szk0Gz9Q",
      "subtitle": "Dialogues on the Great Sayings: A Path to Self-Realization",
      "url":
          "https://youtube.com/playlist?list=PLDqahtm2vA73W7LK13e9K9Uy1rKcKa1ay&feature=shared"
    },
    {
      "title": "Vedantasara of Sadananda",
      "thumbnail":
          "https://i.ytimg.com/vi/h6FbNFjDJqk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAo1uG8YthZ0zXOuwSO8WNyVdALYA",
      "subtitle": " The Essence of Vedanta: A Guide to Non-Dual Wisdom",
      "url":
          "https://youtube.com/playlist?list=PLDqahtm2vA70ccqIRFR_lipqKvxrHBRRw&feature=shared"
    },
    {
      "title": "Yoga & Mind Sciences",
      "thumbnail":
          "https://i.ytimg.com/vi/M-EmX-O1dTI/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCJpCp93daUcq_eN6JWFRaQYPbA0Q",
      "subtitle": "Exploring the Union of Body, Mind, and Consciousness",
      "url":
          "https://youtube.com/playlist?list=PLGQElwzyJxty56xPtGAArwQTiCaRgjobM&feature=shared"
    },
  ];
  final List<Map<String, String>> videoshi = [
    {
      "title": "श्रीमद् भागवत कथा",
      "thumbnail":
          "https://i.ytimg.com/vi/UiuQPRTFce8/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDqblryrd1wq_6hb44LoNOixpvlYw",
      "subtitle":
          "श्रीमद् भागवत कथा हिंदू धर्म के सबसे पवित्र ग्रंथों में से एक है। यह भगवान कृष्ण की लीलाओं और शिक्षाओं का वर्णन करती है। इसमें भक्ति, ज्ञान और वैराग्य के मार्गों का प्रतिपादन किया गया है।",
      "url":
          "https://youtube.com/playlist?list=PLW_QVE4bQ1Epu0kitk6jmQkTPbJBPbz6n&feature=shared"
    },
    {
      "title": "विवेक चूड़ामणि",
      "thumbnail":
      "https://i.ytimg.com/vi/UoaDEL-y3BM/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAS78chaJDa2EZTN-p_Im_4c8P8nQ",
      "subtitle":
      "विवेक चूड़ामणि आदि शंकराचार्य द्वारा रचित एक महत्वपूर्ण ग्रंथ है। इसमें अध्यात्म और ज्ञान के मार्गों का वर्णन किया गया है। स्वामी अविमुक्तेश्वरानंद ने इसकी व्याख्या की है, जिसमें आत्म-ज्ञान और मोक्ष के सिद्धांतों को समझाया गया है।",
      "url":
      "https://www.youtube.com/watch?v=UoaDEL-y3BM&list=PLhYFzRbyD5YgsZLAXrC7sjJQIptsZKWne"
    },
    {
      "title": "देवी भागवत",
      "thumbnail":
      "https://i.ytimg.com/vi/73TljZYEEhk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDhpiWSEezbM1h53_arDWiRXhz-QQ",
      "subtitle":
      "देवी भागवत एक पवित्र हिंदू ग्रंथ है, जिसमें देवी की महिमा और शक्ति का वर्णन किया गया है। इसमें देवी के विभिन्न रूपों और उनकी लीलाओं का वर्णन है, जो भक्तों को आध्यात्मिक ज्ञान और शक्ति प्रदान करता है।",
      "url":
      "https://www.youtube.com/playlist?list=PLyXHXSHxLqKytTG4PkD8RlRe16Q5Zskcz"
    },
    {
      "title": "राम जन्मोत्सव",
      "thumbnail":
      "https://i.ytimg.com/vi/QZncJeIeSLE/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAKUC--c-uQvitSXyJwuzRqGIqraQ",
      "subtitle":
      "राम जन्मोत्सव या राम नवमी हिंदू धर्म का एक महत्वपूर्ण त्योहार है। यह भगवान राम के जन्मदिन के रूप में मनाया जाता है, जो चैत्र मास की शुक्ल पक्ष की नवमी तिथि को पड़ता है।",
      "url":
      "https://www.youtube.com/playlist?list=PLoKnMdfD1SWLTwHlQLNbQ5jbnI90oLvpe"
    },
    {
      "title": "उपनिषद गंगा",
      "thumbnail":
      "https://i.ytimg.com/vi/TuiVHlYeiBg/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAnW22If5NBepn137sSVNgPLwYiQA",
      "subtitle":
      "उपनिषद गंगा स्वामी चिन्मयानंद फाउंडेशन द्वारा प्रस्तुत एक टेलीविजन श्रृंखला है, जिसमें उपनिषदों के ज्ञान को सरल और आकर्षक तरीके से प्रस्तुत किया गया है। इसमें स्वामी चिन्मयानंद के व्याख्यानों को शामिल किया गया है।",
      "url":
      "https://www.youtube.com/playlist?list=PLFr_jkwUp0his35ff0LvPrI_U2oBYdL3b"
    },
    {
      "title": "कृष्ण बाल लीला कथा",
      "thumbnail":
      "https://i.ytimg.com/vi/2hZOoemvTZE/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBFCIRBRYo3w9RAyhol53jIDHVgug",
      "subtitle":
      "कृष्ण बाल लीला कथा इंद्रेश जी महाराज द्वारा प्रस्तुत एक पवित्र कथा है, जिसमें भगवान कृष्ण के बाल्यकाल की लीलाओं और चमत्कारों का वर्णन किया गया है। इसमें भक्ति और ज्ञान के मार्गों का प्रतिपादन किया गया है।",
      "url":
      "https://www.youtube.com/playlist?list=PLW_QVE4bQ1ErQDd9rugjYFFiVjSb36GIX"
    },
    {
      "title": "सनातन धर्म दर्शन",
      "thumbnail":
      "https://i.ytimg.com/vi/BT3X23bF5EQ/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDH1MnuTmiFnpZiUWD9KWXVSlZJWg",
      "subtitle":
      "सनातन धर्म दर्शन एक प्राचीन और व्यापक दर्शन है, जो भारतीय संस्कृति और हिंदू धर्म पर आधारित है। इसमें आत्मा, परमात्मा, कर्म, धर्म, मोक्ष और पुनर्जन्म जैसे मूलभूत सिद्धांतों का वर्णन किया गया है। यह जीवन के उद्देश्य और लक्ष्य को समझने में मदद करता है।",
      "url":
      "https://www.youtube.com/playlist?list=PLxYDMSdfTAgRcDxcxmgoMvMNxySL0eaPH"
    },
    {
      "title": "श्री रामचरितमानस",
      "thumbnail":
      "https://i.ytimg.com/vi/_WBkHVmnW_Y/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCSl2uj3PrM5YE2_3DFLKmJQbUufQ",
      "subtitle":
      "श्री रामचरितमानस गोस्वामी तुलसीदास द्वारा रचित एक महान हिंदू ग्रंथ है, जो भगवान राम की जीवनी और लीलाओं का वर्णन करता है। यह ग्रंथ अवधी भाषा में लिखा गया है और हिंदू धर्म के सबसे पवित्र और प्रेरक ग्रंथों में से एक माना जाता है।",
      "url":
      "https://www.youtube.com/playlist?list=PLxYDMSdfTAgSJZShNs8JQcdvQMGZUFVHv"
    },
  ];

  VideoPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    List<Map<String, String>> getList(String locale,
        List<Map<String, String>> engList, List<Map<String, String>> hinList) {
      return locale == 'hi' ? hinList : engList;
    }

    Scaffold getWarning(String locale, Scaffold engWarn, Scaffold hindWarn) {
      return locale == 'hi' ? hindWarn : engWarn;
    }
    Text getAppBarText(String locale, Text engText, Text hindText) {
      return locale == 'hi' ? hindText : engText;
    }

    Text appbarText = getAppBarText(currentLocale, const Text("Video Gallery",
        style:
        TextStyle(color: Colors.black, fontFamily: "LibreBaskerville"),), const Text("वीडियो गैलरी",
        style:
        TextStyle(color: Colors.black, fontFamily: "Eczar"),));

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
                  'Unable to load video tiles.\nPlease check your connection and try again.',
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
                  'वीडियो टाइल्स लोड नहीं हो पा रहे हैं.\nकृपया अपना कनेक्शन जाँचें और पुनः प्रयास करें।',
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
    List<Map<String, String>> mainList =
        getList(currentLocale, videos, videoshi);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: appbarText,
        backgroundColor: background,
      ),
      body: isConnectedToInternet
          ? ListView.builder(
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                final video = mainList[index];
                return videotile(video);
              },
            )
          : warningInternet,
    );
  }

  GestureDetector videotile(Map<String, String> video) {
    return GestureDetector(
      onTap: () {
        // Open YouTube URL on tap
        _launchURL(video["url"]!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    video["thumbnail"]!,
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: 80,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                // Video Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video["title"]!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Eczar",
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        video["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontFamily: "Eczar",
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
