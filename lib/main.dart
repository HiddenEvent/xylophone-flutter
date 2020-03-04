import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final assetAudioPlayer = AssetsAudioPlayer();

  void audioChange(int audioNum) {
    assetAudioPlayer.open('assets/note$audioNum.wav');
    assetAudioPlayer.play();
  }
  //함수부분
  Widget buildKey(int audioNum,Color color) {
    Widget colorBar =  Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          setState(() {
            audioChange(audioNum);
          });
        },
      ),
    );
    return colorBar;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1,Colors.red),
              buildKey(2,Colors.orange),
              buildKey(3,Colors.yellow),
              buildKey(4,Colors.green),
              buildKey(5,Colors.blue),
              buildKey(6,Colors.brown),
              buildKey(7,Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
