import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(XylophoneApp());
}

class PlayButton extends StatelessWidget {
  final int note;
  final Color backgroundColor;

  PlayButton({this.note, this.backgroundColor});

  void playNote(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () => playNote(note),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        // White text to display note number
        child: Text(
          "Note $note",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}

class XylophoneApp extends StatelessWidget {
  void playNote(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.red, systemNavigationBarColor: Colors.black),
    );

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PlayButton(note: 1, backgroundColor: Colors.red),
              PlayButton(note: 2, backgroundColor: Colors.orange),
              PlayButton(note: 3, backgroundColor: Colors.yellow),
              PlayButton(note: 4, backgroundColor: Colors.green),
              PlayButton(note: 5, backgroundColor: Colors.teal),
              PlayButton(note: 6, backgroundColor: Colors.blue),
              PlayButton(note: 7, backgroundColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
