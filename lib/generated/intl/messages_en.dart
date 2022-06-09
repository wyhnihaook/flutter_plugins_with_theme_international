// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("AppName"),
        "autoBySystem": MessageLookupByLibrary.simpleMessage("Auto"),
        "content1": MessageLookupByLibrary.simpleMessage(
            "You have pushed the button this many times:"),
        "content10": MessageLookupByLibrary.simpleMessage("custom text"),
        "content2": MessageLookupByLibrary.simpleMessage("test content"),
        "content3":
            MessageLookupByLibrary.simpleMessage("click refresh local widget"),
        "content4":
            MessageLookupByLibrary.simpleMessage("switch theme to dark"),
        "content5":
            MessageLookupByLibrary.simpleMessage("switch theme to light"),
        "content6":
            MessageLookupByLibrary.simpleMessage("switch locale to english"),
        "content7":
            MessageLookupByLibrary.simpleMessage("switch locale to chinese"),
        "content8": MessageLookupByLibrary.simpleMessage("goto next page"),
        "content9":
            MessageLookupByLibrary.simpleMessage("change theme color to red"),
        "title1": MessageLookupByLibrary.simpleMessage("Flutter Demo"),
        "title2": MessageLookupByLibrary.simpleMessage("Flutter Demo Home Page")
      };
}
