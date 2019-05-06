import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginTts {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_tts');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> isLanguageAvailable (String language) async {
    final bool languageAvailable = await _channel.invokeMethod('isLanguageAvailable', <String, Object>{
      'language': language});
    return languageAvailable;
  }

  static Future<bool> setLanguage (String language) async {
    final bool isSet = await _channel.invokeMethod('setLanguage', <String, Object>{
      'language': language});
    return isSet;
  }

  static Future<List<String>> getAvailableLanguages () => _channel.invokeMethod('getAvailableLanguages').then((result) => result.cast<String>());

  static void speak (String text) => _channel.invokeMethod('speak', <String, Object>{
    'text': text});

  static void stop() async {
    _channel.invokeMethod('stop');
  }

  static void shutdown() async {
    _channel.invokeMethod('shutdown');
  }

  static void setSpeechRate(double rate) async {
    _channel.invokeMethod('setSpeechRate', <String, Object>{
      'rate': rate.toString()
    });
  }
}
