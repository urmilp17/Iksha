import 'dart:convert';
import 'package:http/http.dart' as http;

class AstraDBVectorStore {
  final String collectionName;
  final String apiEndpoint;
  final String token;
  final String namespace;

  AstraDBVectorStore({
    required this.collectionName,
    required this.apiEndpoint,
    required this.token,
    required this.namespace,
  });

  Future<List<String>> similaritySearch(String query, {int limit = 5}) async {
    final url = Uri.parse('$apiEndpoint/vectors/search');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'namespace': namespace,
      'query': query,
      'topK': limit,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(data['results'].map((result) => result['doc']));
    } else {
      throw Exception('Failed to perform similarity search: ${response.body}');
    }
  }
}
