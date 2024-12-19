// import 'package:langchain/langchain.dart';
// import 'package:langchain_google/langchain_google.dart';
//
// class ConversationalChain {
//   final String googleApiKey = "AIzaSyD2-J-odcMaAX5kV_L73Om4RsnX6o5kVNo";
//   final String astraDbApplicationToken =
//       "AstraCS:NsrvnBwFWYxEOcdfskSGsYwR:7ad8f431bcb33dfbfca5495b9415a1bada8302ddd717aeeca9a9c2bc300776f3";
//   final String astraDbId = "58603c57-3899-4450-b89a-50a1c8c76602";
//   final String astraDbNamespace = "scriptures";
//   final String astraDbEndpoint =
//       "YOUR_ASTRA_DB_API_ENDPOINT"; // Replace with your actual endpoint
//
//   late final GoogleTextEmbeddingModel embeddingModel;
//   late final VectorStore vectorStore;
//
//   ConversationalChain() {
//     // Configure Google Generative AI
//     embeddingModel = GoogleTextEmbeddingModel(
//       apiKey: googleApiKey,
//     );
//
//     // Initialize VectorStore (replace with appropriate constructor for your case)
//     vectorStore = MemoryVectorStore( // Adjust if using a different vector store
//       embeddingModel: embeddingModel,
//     );
//   }
//
//   PromptTemplate getPromptTemplate() {
//     const promptTemplate = """
//     Answer the question as detailed as possible from the provided context, make sure to provide all the details.
//     If the answer is not in the provided context, just say, "answer is not available in the context."
//     Do not provide the wrong answer.
//
//     Context:
//     {context}
//
//     Question:
//     {question}
//
//     Answer:
//     """;
//
//     return PromptTemplate(template: promptTemplate, inputVariables: ["context", "question"]);
//   }
//
//   Future<LLMChain> getConversationalChain() async {
//     final prompt = getPromptTemplate();
//     final llm = GoogleChatModel(
//       apiKey: googleApiKey,
//       temperature: 0.3,
//     );
//
//     return LLMChain(llm: llm, prompt: prompt);
//   }
//
//   Future<String> getUserResponse(String userQuestion) async {
//     // Perform similarity search in the vector store
//     final docs = await vectorStore.similaritySearch(userQuestion);
//
//     // Get the conversational chain
//     final chain = await getConversationalChain();
//
//     // Invoke the chain with context and question
//     final response = await chain.invoke({
//       "context": docs.map((doc) => doc.text).join("\n"), // Combine doc texts into a single string
//       "question": userQuestion,
//     });
//
//     return response["output"] ?? "No response generated.";
//   }
// }
