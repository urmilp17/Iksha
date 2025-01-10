import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:audioplayers/audioplayers.dart';

class Ginfo extends StatefulWidget {
  const Ginfo({super.key});

  @override
  State<Ginfo> createState() => _GinfoState();
}

class _GinfoState extends State<Ginfo> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  double _playbackSpeed = 1.0;
  final String _audioUrl =
      'https://firebasestorage.googleapis.com/v0/b/iksha-324658.firebasestorage.app/o/Other%2Fgarbha1.MP3?alt=media&token=b9343e28-7cfb-4f69-8119-6de32360ffab';
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _currentPosition = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(_audioUrl));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _seekAudio(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
    });
    _audioPlayer.setPlaybackRate(speed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          "गर्भसंस्कार",
          style: TextStyle(fontFamily: "Yatra", fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 12, 8),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "The term Garbhsanskar is often heard these days, "
                      "but most people only have a superficial understanding of it. "
                      "\nLiterally, it means the sanskars (values or influences) "
                      "imparted to the fetus in the womb. However, what kind of "
                      "sanskars can be imparted to the fetus, and how? What is their significance, "
                      "and why are they necessary? It's essential to understand these aspects.",
                      style: TextStyle(fontFamily: "Eczar", fontSize: 15),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 270,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/iksha-324658.firebasestorage.app/o/Other%2Fpreg.png?alt=media&token=1805a3a8-c673-4c44-952a-7e465c9899e1"))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 32,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    "Ritualistic Perspective",
                    style: TextStyle(
                        fontFamily: "Eczar",
                        color: iconcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "\"Pumān sūyate yasmāt iti puṁsavanam\"",
                style: TextStyle(
                    fontFamily: "Eczar",
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Text(
              "The process through which a \"pumān\" (a valiant and \nvirtuous progeny) is born is called Puṁsavana.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Eczar", fontSize: 12),
            ),
            const ToggleInfoWidget(
                text:
                    "In practice and Ayurveda, this samskāra is described as a ritual for achieving the desired gender of the child. "
                    "It is performed to determine whether the unborn child should be male or female. However, the Vedas suggest that "
                    "this samskāra should be performed for everyone with the intention of obtaining a virtuous and radiant child. "
                    "\nHence, it is advised that this ritual be performed in the second, fourth, sixth, or eighth month of pregnancy."
                    "\n\nAccording to Ayurveda, the gender of the fetus is determined two months after conception. "
                    "This means that within one or one and a half months after the cessation of menstruation, "
                    "it can be inferred whether the fetus will be male or female. It is believed that prior to this stage, "
                    "the gender of the fetus can be influenced or altered. However, if the ritual were solely for altering the gender, "
                    "there would be no recommendation to perform Puṁsavana in the fourth, sixth, or eighth month."),
            const Center(
              child: Text(
                "\"Avyaktaḥ prathame māsi saptāhāt kalalī bhavet।\n Garbhaḥ puṁsavānānyaya pūrva vyakte prayojayet॥\"",
                style: TextStyle(
                    fontFamily: "Eczar",
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "In the first month, the fetus remains undifferentiated in terms of gender. In the second month, the differentiation starts becoming apparent. Hence, the Puṁsavana samskāra should ideally be performed before the gender of the fetus becomes evident",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Eczar", fontSize: 12),
              ),
            ),
            const ToggleInfoWidget(
                text:
                    "The ancient sciences revealed that the gender of the fetus could be influenced, making this knowledge accessible to all.In today's society, the ratio of males to females has become imbalanced. The number of females is decreasing rapidly, creating a serious concern for the future.In ancient times, the number of females was greater than males. Boys were given more importance, partly because males frequently lost their lives in wars or during long journeys. However, in the current scenario, there is no necessity to perform Puṁsavana purely for ensuring a male child.That said, Puṁsavana is not limited to altering gender; it has greater benefits, such as ensuring the radiance, virtues, and well-being of the fetus. It also helps prevent genetic defects (genetic disorders) and protects the fetus."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 32,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    "Philosophy",
                    style: TextStyle(
                        fontFamily: "Eczar",
                        color: iconcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _audioUrl.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 50,
                          color: iconcolor,
                        ),
                        onPressed: _togglePlayPause,
                      )
                    : const CircularProgressIndicator(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Slider(
                      value: _currentPosition.inSeconds.toDouble(),
                      max: _totalDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _seekAudio(value);
                      },
                      activeColor: iconcolor,
                      inactiveColor: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                          child: Text(
                            '${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500,fontFamily: "Eczar"),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Row(
                          children: [
                            const Text("Speed: ", style: TextStyle(fontSize: 16,fontFamily: "Eczar")),
                            DropdownButton<double>(
                              value: _playbackSpeed,
                              items: const [
                                DropdownMenuItem(value: 0.5, child: Text("0.5x",style: TextStyle(fontFamily: "Eczar"),),),
                                DropdownMenuItem(value: 1.0, child: Text("1.0x",style: TextStyle(fontFamily: "Eczar"),),),
                                DropdownMenuItem(value: 1.5, child: Text("1.5x",style: TextStyle(fontFamily: "Eczar"),),),
                                DropdownMenuItem(value: 2.0, child: Text("2.0x",style: TextStyle(fontFamily: "Eczar"),),),
                              ],
                              onChanged: (value) {
                                if (value != null) _changePlaybackSpeed(value);
                              },
                            ),
                          ],
                        ),
                      ],
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

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class ToggleInfoWidget extends StatefulWidget {
  final String text;

  const ToggleInfoWidget({super.key, required this.text});

  @override
  _ToggleInfoWidgetState createState() => _ToggleInfoWidgetState();
}

class _ToggleInfoWidgetState extends State<ToggleInfoWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// child: Text(
// widget.text,
// textAlign: TextAlign.center,
// style: const TextStyle(
// fontFamily: "Eczar",
// fontSize: 13,
// ),
// ),
