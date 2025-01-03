// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(error) => "Error fetching user name: ${error}";

  static m1(userName) => "Hey, ${userName} 👋";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "books_to_read" : MessageLookupByLibrary.simpleMessage("Books to Read"),
    "books_to_read_description" : MessageLookupByLibrary.simpleMessage("Recommended reading materials for your growth."),
    "discrimination" : MessageLookupByLibrary.simpleMessage("DISCRIMINATION"),
    "dispassion" : MessageLookupByLibrary.simpleMessage("DISPASSION"),
    "explore" : MessageLookupByLibrary.simpleMessage("Explore"),
    "fetch_error_message" : m0,
    "hey_user" : m1,
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "mumukshutva" : MessageLookupByLibrary.simpleMessage("MUMUKSHUTVA"),
    "sadhana_description" : MessageLookupByLibrary.simpleMessage("Sadhana Chatushtaya provides a foundation for spiritual growth, enabling seekers to discern reality, detach from worldly desires, cultivate self-control, and intensely yearn for liberation, leading to Self-realization."),
    "sadhana_title" : MessageLookupByLibrary.simpleMessage("Sadhana Chatusthaya"),
    "sampradayas_description" : MessageLookupByLibrary.simpleMessage("According to Gita 4.2, Sampradayas (spiritual lineages) preserve and transmit sacred knowledge, ensuring its authenticity and continuity, thereby guiding seekers on the path to self-realization."),
    "sampradayas_title" : MessageLookupByLibrary.simpleMessage("Sampradayas"),
    "search_placeholder" : MessageLookupByLibrary.simpleMessage("Search..."),
    "shad_sampati" : MessageLookupByLibrary.simpleMessage("SHAD SAMPATI"),
    "trigunas" : MessageLookupByLibrary.simpleMessage("Trigunas"),
    "trigunas_description" : MessageLookupByLibrary.simpleMessage("Understanding the three gunas in daily life."),
    "video_recommendation" : MessageLookupByLibrary.simpleMessage("Video Recommendation"),
    "video_recommendation_description" : MessageLookupByLibrary.simpleMessage("Explore a curated selection of videos on various topics."),
    "welcome_message" : MessageLookupByLibrary.simpleMessage("Welcome to Iksha")
  };
}
