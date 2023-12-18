import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'リアクション',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'プレゼンテーション リアクション'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _totalReactions = 0;
  final audioPlayer = AudioPlayer();

  void _onReactionButtonPressed(String soundFileName) {
    setState(() {
      _totalReactions++;
    });
    audioPlayer.play(AssetSource(soundFileName));
  }

  Widget _buildReactionButton(String label, String soundFileName) {
    return ElevatedButton(
      onPressed: () => _onReactionButtonPressed(soundFileName),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          _buildReactionButton('なるほど？', 'sound1.mp3'),
          _buildReactionButton('たしかに！', 'sound2.mp3'),
          _buildReactionButton('さすが！', 'sound3.mp3'),
          _buildReactionButton('おお〜？（期待）', 'sound4.mp3'),
          _buildReactionButton('わくわく！', 'sound5.mp3'),
          _buildReactionButton('おお〜！（驚き）', 'sound6.mp3'),
          _buildReactionButton('知らなかった〜！', 'sound7.mp3'),
          _buildReactionButton('はいはい（同意）', 'sound8.mp3'),
          _buildReactionButton('間違いない！', 'sound9.mp3'),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text('総リアクション数: $_totalReactions'),
      ),
    );
  }
}
