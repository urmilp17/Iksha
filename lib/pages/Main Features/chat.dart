import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({super.key});

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final TextEditingController _questionController = TextEditingController();
  String _answer = '';
  bool _isLoading = false;

  // Function to send the question to the API
  Future<void> fetchAnswer(String question) async {
    final String apiUrl = "http://127.0.0.1:8000/ask";

    setState(() {
      _isLoading = true;
      _answer = '';
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'question': question}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          _answer = responseData['answer'] ?? "No answer received.";
        });
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        setState(() {
          _answer = errorData['detail'] ?? "An error occurred.";
        });
      }
    } catch (e) {
      setState(() {
        _answer = "Failed to connect to the server: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Your Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: "Enter your question",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final question = _questionController.text.trim();
                if (question.isNotEmpty) {
                  fetchAnswer(question);
                } else {
                  setState(() {
                    _answer = "Please enter a question.";
                  });
                }
              },
              child: Text("Get Answer"),
            ),
            SizedBox(height: 16.0),
            if (_isLoading)
              CircularProgressIndicator()
            else if (_answer.isNotEmpty)
              Expanded(
                child: RawScrollbar(
                  child: SingleChildScrollView(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          _answer,
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            height: 1.5,
                            fontFamily: 'Eczar',
                            color: Colors
                                .black, // Change this to your desired text color
                          ),
                          speed: const Duration(
                              milliseconds: 50), // Adjust speed as needed
                        ),
                      ],
                      isRepeatingAnimation:
                          false, // Set to true if you want the animation to repeat
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
