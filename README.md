# flutter_plugin_tts

A new Flutter plugin.

[Github](https://github.com/XYliang/Flutter_plugin_tts)

## Getting Started


English Document （中文文档在下面）


A flutter library that supports tts

Steps for usage:

Import library
```
Import 'package:flutter_plugin_tts/flutter_plugin_tts.dart';
```

Example of use:

```
@override
  Widget build(BuildContext context) {
    Return MaterialApp(
      Home: Scaffold(
        appBar: AppBar(
          Title: const Text('Plugin example app'),
        ),
        Body: ListView(
          Children: <Widget>[
            RaisedButton(child: const Text('set to Chinese'), onPressed: () {
              FlutterPluginTts.setLanguage('zh-CN').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('set to English'), onPressed: () {
              FlutterPluginTts.setLanguage('en-AU').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('set to Japanese'), onPressed: () {
              FlutterPluginTts.setLanguage('ja-JP').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('play Chinese'), onPressed: () {
              FlutterPluginTts.speak ('Hello, World');
            }),
            RaisedButton(child: const Text('playing English'), onPressed: () {
              FlutterPluginTts.speak('hello,world');
            }),
            RaisedButton(child: const Text('playing Japanese'), onPressed: () {
              FlutterPluginTts.speak('こんにちは, world');
            }),
            RaisedButton(child: const Text), onPressed: () {
              FlutterPluginTts.speak('Hello, World. I am testing a long sentence. You can stop my play by clicking the play pause button below. If I don't stop it means there is still a problem with this stop function. Please Continue to repair. La la la la!');
            }),
            RaisedButton(child: const Text), onPressed: () {
              FlutterPluginTts.stop();
            }),
            RaisedButton(child: const Text('play pause, start new sentence immediately'), onPressed: () {
              FlutterPluginTts.stop();
              FlutterPluginTts.speak('hello,world');
            }),
            RaisedButton(child: const Text('Chinese usability'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('zh-CN').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('English usability'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('en-US').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('Japanese usability'), onPressed: () {
              FlutterPluginTts.isLanguageAvailable('ja-JP').then((v){
                debugPrint('r = $v');
              });
            }),
            RaisedButton(child: const Text('setSpeechRate = 1'), onPressed: () {
              FlutterPluginTts.setSpeechRate(0.5);
            }),
            RaisedButton(child: const Text('setSpeechRate = 0.5'), onPressed: () {
              FlutterPluginTts.setSpeechRate(0.25);
            }),
            RaisedButton(child: const Text('setSpeechRate = 2'), onPressed: () {
              FlutterPluginTts.setSpeechRate(1);
            }),
          ],
        ),
      ),
    );
  }
```

Welcome everyone to support my website
[website] (https://tryenough.com),


中文文档

一个支持tts的flutter库

使用步骤：

导入库
```
import 'package:flutter_plugin_tts/flutter_plugin_tts.dart';
```

使用例子：

```
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
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
```

欢迎大家支持我的网站
[网站](https://tryenough.com),




This project is a starting point for a Flutter
[plug-in package](https://flutter.io/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.io/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
