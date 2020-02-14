import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_tts/flutter_plugin_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterPluginTts.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        ListView(
          children: <Widget>[
            RaisedButton(child: const Text('设置成汉语'), onPressed: () {
              FlutterPluginTts.setLanguage('zh-CN').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('设置成英语'), onPressed: () {
              FlutterPluginTts.setLanguage('en-AU').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('设置成日语'), onPressed: () {
              FlutterPluginTts.setLanguage('ja-JP').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('播放汉语'), onPressed: () {
              FlutterPluginTts.speak('你好，世界');
            }),
            RaisedButton(child: const Text('播放英语'), onPressed: () {
              FlutterPluginTts.speak('hello,world');
            }),
            RaisedButton(child: const Text('播放日语'), onPressed: () {
              FlutterPluginTts.speak('こんにちは、世界');
            }),
            RaisedButton(child: const Text('播放长句子'), onPressed: () {
              FlutterPluginTts.speak('你好，世界。我正在测试播放很长的句子，你可以点击下方的播放暂停按钮来终止我的播放，如果我没有停止那就意味着这个停止功能还有问题。请你继续修复。啦啦啦啦！');
            }),
            RaisedButton(child: const Text('播放句子加延迟ios'), onPressed: () {
              FlutterPluginTts.speak('动作1');
              FlutterPluginTts.speakWithDuration(3);
              FlutterPluginTts.speak('动作6');
            }),
            RaisedButton(child: const Text('播放暂停'), onPressed: () {
              FlutterPluginTts.stop();
            }),
            RaisedButton(child: const Text('播放暂停，立刻开始新句子'), onPressed: () {
              FlutterPluginTts.stop();
              FlutterPluginTts.speak('hello,world');
            }),
            RaisedButton(child: const Text('中文可用性'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('zh-CN').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('英文可用性'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('en-US').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('日文可用性'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('ja-JP').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('设置语速为1正常'), onPressed: () {
              FlutterPluginTts.setSpeechRate(0.5);
            }),
            RaisedButton(child: const Text('设置语速为0.5'), onPressed: () {
              FlutterPluginTts.setSpeechRate(0.25);
            }),
            RaisedButton(child: const Text('设置语速为2'), onPressed: () {
              FlutterPluginTts.setSpeechRate(1);
            }),
          ],
        ),
      ),
    );
  }
}
