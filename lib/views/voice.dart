import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'dart:io';
import 'dart:async';

class VoiceAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: VoiceButton(),
    );
  }
}

class VoiceButton extends StatefulWidget {
  @override
  _VoiceButtonState createState() => _VoiceButtonState();
}

class _VoiceButtonState extends State<VoiceButton> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  var _locale = "";

  bool _toggled = false;
  var _fab_color = Colors.red;

  String _message = "";

  void start_listen() async {
    var listenerAvail = await _initSTT();
    _speech.stop();
    if (listenerAvail) {
      _speech.listen(
          onResult: result_listener,
          localeId: _locale,
          onSoundLevelChange: null,
          cancelOnError: true,
          partialResults: true);
    }
    print("here");
  }

  void stop_listen() {
    _speech.cancel();
    _speech.stop();
  }

  Future<bool> _initSTT() async {
    bool available = await _speech.initialize(
        onStatus: status_listener, onError: error_listener);
    if (available) {
      var systemLocale = await _speech.systemLocale();
      _locale = systemLocale!.localeId;
    } else {
      print("The user has denied the use of speech recognition.");
    }
    return available;
  }

  void status_listener(String status) {
    print("$status");
  }

  void error_listener(SpeechRecognitionError error) {
    print("${error.errorMsg} - ${error.permanent}");
  }

  void result_listener(SpeechRecognitionResult result) {
    setState(() {
      _message = result.recognizedWords;
      print("$_message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Button Demo'),
      ),
      body: Center(child: Text('Patient message: $_message + $_toggled')),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _toggled = !_toggled;
          if (_toggled) {
            _fab_color = Colors.blue;
            start_listen();
          } else {
            _fab_color = Colors.red;
            stop_listen();
            // setState(() {
            //   _message= "";
            // });
          }
        }),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
        backgroundColor: _fab_color,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//
//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return const Divider(); /*2*/
//
//           final index = i ~/ 2; /*3*/
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }
//
//   Widget _buildRow(WordPair pair) {
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Startup Name Generator'),
//       ),
//       body: _buildSuggestions(),
//     );
//   }
// }