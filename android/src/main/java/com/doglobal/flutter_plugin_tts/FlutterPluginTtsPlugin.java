package com.doglobal.flutter_plugin_tts;

import android.app.Activity;
import android.speech.tts.TextToSpeech;
import android.util.Log;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.StringTokenizer;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterPluginTtsPlugin */
public class FlutterPluginTtsPlugin implements MethodCallHandler, TextToSpeech.OnInitListener {

  private Activity mActivity;
  private TextToSpeech myTTS;

  private FlutterPluginTtsPlugin(Activity context) {
    mActivity = context;
    myTTS = new TextToSpeech(mActivity, this);
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_tts");
    channel.setMethodCallHandler(new FlutterPluginTtsPlugin(registrar.activity()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("speak")) {
      String text = call.argument("text");
      speak(text);
    } else if (call.method.equals("stop")) {
      stop();
    } else if (call.method.equals("shutdown")) {
      shutdown();
    } else if (call.method.equals("isLanguageAvailable")) {
      String language = call.argument("language");
      final Boolean isAvailable = isLanguageAvailable(language);
      result.success(isAvailable);
    } else if (call.method.equals("setLanguage")) {
      String language = call.argument("language");
      final Boolean success = setLanguage(language);
      result.success(success);
    } else if (call.method.equals("getAvailableLanguages")) {
      result.success(getAvailableLanguages());
    } else if(call.method.equals("setSpeechRate")) {
      String rate = call.argument("rate");
      result.success(setSpeechRate(Float.valueOf(rate)));
    } else if(call.method.equals("isSpeaking")) {
      result.success(isSpeaking());
    }
    else if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }

  public void onInit(int initStatus) {
    if (initStatus == TextToSpeech.ERROR) {
      Toast.makeText(this.mActivity, "Sorry! Text To Speech failed...", Toast.LENGTH_LONG).show();
    }
  }

  void speak(String text) {
    if (myTTS != null) {
      myTTS.speak(text, TextToSpeech.QUEUE_FLUSH, null);
    }
  }

  void stop() {
    if (myTTS != null) {
      myTTS.stop();
    }
  }

  void shutdown() {
    if (myTTS != null) {
      myTTS.shutdown();
    }
  }

  // success = 0 or error = -1
  int setSpeechRate(float rateV) {
    int r = -1;
    if (myTTS != null) {
      r = myTTS.setSpeechRate(rateV * 2);
    }
    return r;
  }

  boolean isSpeaking() {
    boolean r = false;
    if (myTTS != null) {
      r = myTTS.isSpeaking();
    }
    return r;
  }

  // success = 0 or error = -1
  int setPitch(float rateV) {
    int r = -1;
    if (myTTS != null) {
      r = myTTS.setPitch(rateV);
    }
    return r;
  }

  Boolean isLanguageAvailable(String locale) {
    Boolean isAvailable = false;
    try {
      System.out.print("is avalilable = "+ myTTS.isLanguageAvailable(stringToLocale(locale)) + "");
      isAvailable = myTTS.isLanguageAvailable(stringToLocale(locale)) >= TextToSpeech.LANG_AVAILABLE;
    } finally {
      return isAvailable;
    }
  }

  Boolean setLanguage(String locale) {
    Boolean success = false;
    try {
      myTTS.setLanguage(stringToLocale(locale));
      success = true;
    } finally {
      return success;
    }

  }

  List<String> getAvailableLanguages() {
    Set<Locale> locales = myTTS.getAvailableLanguages();
    List<String> localeList = new ArrayList<String>();
    for (Locale locale : locales) {
      localeList.add(locale.toString().replace("_", "-"));
    }
    return localeList;
  }

  private Locale stringToLocale(String locale) {
    String l = null;
    String c = null;
    StringTokenizer tempStringTokenizer = new StringTokenizer(locale,"-");
    if(tempStringTokenizer.hasMoreTokens()){
      l = tempStringTokenizer.nextElement().toString();
    }
    if(tempStringTokenizer.hasMoreTokens()){
      c = tempStringTokenizer.nextElement().toString();
    }
    return new Locale(l,c);
  }
}
