import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Initialize AstraDB configurations
final String astraDbApiEndpoint = dotenv.get('ASTRA_DB_API_ENDPOINT');
final String astraDbApplicationToken = dotenv.get('ASTRA_DB_APPLICATION_TOKEN');

// Function to connect to AstraDB
Future<void> connectToAstraDB() async {
  var url = Uri.parse('$astraDbApiEndpoint/v1/databases');
  var response = await http.get(url, headers: {
    'X-Cassandra-Token': astraDbApplicationToken,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Connected to AstraDB. Collections: ${data['data']}');
  } else {
    print('Failed to connect to AstraDB: ${response.body}');
  }
}

// Function to interact with Google AI model for embeddings (simulate the embedding call)
Future<String> getGoogleGenerativeAIEmbedding(String text) async {
  var url = Uri.parse('https://googleapis.com/embedding');  // Adjust to correct URL for Google API
  var response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer ${dotenv.get('GOOGLE_API_KEY')}',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'text': text}),
  );

  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    return responseData['embedding'];  // Adjust based on actual API response
  } else {
    print('Failed to get embedding: ${response.body}');
    return '';
  }
}

// Function to handle user input and process using the embeddings and context (similar to the Python version)
Future<String> userInput(String userQuestion) async {
  // Search similar documents (you can define this part based on your database search implementation)
  var docs = await searchDocs(userQuestion);

  // Assuming 'docs' contains context, simulate a chain (this is just a simplified example)
  var context = docs.join(" ");
  var answer = await getGoogleGenerativeAIEmbedding('$context $userQuestion');
  return answer;
}

// Simulated search function
Future<List<String>> searchDocs(String query) async {
  // Call AstraDB API to search for similar documents
  // This is a simplified version; implement actual search logic with AstraDB
  return ['Example document 1 related to query', 'Example document 2 related to query'];
}




// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// class LangchainIntegration {
//   final String googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';
//   final String astraDbToken = dotenv.env['ASTRA_DB_APPLICATION_TOKEN'] ?? '';
//   final String astraDbId = dotenv.env['ASTRA_DB_ID'] ?? '';
//   final String astraDbApiEndpoint = dotenv.env['ASTRA_DB_API_ENDPOINT'] ?? '';
//   final String astraDbNamespace = dotenv.env['ASTRA_DB_NAMESPACE'] ?? '';
//
//   // Configure Google GenAI API
//   Future<void> configureGenAI() async {
//     if (googleApiKey.isEmpty) {
//       throw Exception("Google API key is missing!");
//     }
//     // Typically, set headers or configurations for your Google GenAI API requests here.
//   }
//
//   // Function to perform similarity search using AstraDB Vector Store
//   Future<List<String>> similaritySearch(String query) async {
//     final url = Uri.parse('$astraDbApiEndpoint/namespaces/$astraDbNamespace/collections/astra_vector_langchain/search');
//     final headers = {
//       'Authorization': 'Bearer $astraDbToken',
//       'Content-Type': 'application/json',
//     };
//     final body = json.encode({
//       "query": query,
//       "top_k": 5, // Number of similar documents to fetch
//     });
//
//     final response = await http.post(url, headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return List<String>.from(data['results']?.map((doc) => doc['text']) ?? []);
//     } else {
//       throw Exception('Error performing similarity search: ${response.body}');
//     }
//   }
//
//   // Function to get conversational chain response
//   Future<String> getConversationalChain(String context, String question) async {
//     final url = Uri.parse('https://genai.googleapis.com/v1beta2/models/gemini-pro:predict');
//     final headers = {
//       'Authorization': 'Bearer $googleApiKey',
//       'Content-Type': 'application/json',
//     };
//     final promptTemplate = """
//     Answer the question as detailed as possible from the provided context, make sure to provide all the details.
//     If the answer is not in the provided context, just say, "answer is not available in the context."
//     Do not provide the wrong answer.
//
//     Context:
//     $context
//
//     Question:
//     $question
//
//     Answer:
//     """;
//
//     final body = json.encode({
//       "prompt": promptTemplate,
//       "temperature": 0.3,
//     });
//
//     final response = await http.post(url, headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['candidates'][0]['output'] ?? "No response available.";
//     } else {
//       throw Exception('Error getting response from GenAI: ${response.body}');
//     }
//   }
//
//   // Function to handle user input and return response
//   Future<String> userInput(String userQuestion) async {
//     try {
//       final docs = await similaritySearch(userQuestion);
//       final context = docs.join('\n');
//       final response = await getConversationalChain(context, userQuestion);
//       return response;
//     } catch (e) {
//       return 'Error: $e';
//     }
//   }
// }
