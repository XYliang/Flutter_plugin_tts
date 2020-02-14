#import "FlutterPluginTtsPlugin.h"

@implementation FlutterPluginTtsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_tts"
            binaryMessenger:[registrar messenger]];
  FlutterPluginTtsPlugin* instance = [[FlutterPluginTtsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)init {
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    self.rate = (AVSpeechUtteranceMaximumSpeechRate - AVSpeechUtteranceMinimumSpeechRate) * 0.5;
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"speak" isEqualToString:call.method]) {
        [self speak:call.arguments[@"text"]];
    } else if ([@"stop" isEqualToString:call.method]) {
        [self stop];
    } else if ([@"setSpeechRate" isEqualToString:call.method]) {
        NSString *rate = call.arguments[@"rate"];
        [self setSpeechRate:rate.floatValue];
    } else if ([@"speakWithDuration" isEqualToString:call.method]) {
        NSString *d = call.arguments[@"duration"];
        if (!d) {
            [self speak:@""];
        } else {
            NSTimeInterval t = [d doubleValue];
            [self speakDuration:t];
        }
    } else if ([@"shutdown" isEqualToString:call.method]) {
        [self shutdown];
    } else if ([@"isLanguageAvailable" isEqualToString:call.method]) {
        BOOL isAvailable = [self isLanguageAvailable:call.arguments[@"language"]];
        result(@(isAvailable));
    } else if ([@"setLanguage" isEqualToString:call.method]) {
        BOOL success = [self setLanguage:call.arguments[@"language"]];
        result(@(success));
    } else if ([@"getAvailableLanguages" isEqualToString:call.method]) {
        result([self getLanguages]);
    } else if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (BOOL) isLanguageAvailable:(NSString*) locale {
    NSArray<AVSpeechSynthesisVoice*> *voices = [AVSpeechSynthesisVoice speechVoices];
    for (AVSpeechSynthesisVoice* voice in voices) {
        if([voice.language isEqualToString:locale])
            return YES;
    }
    return NO;
}

-(BOOL)setSpeechRate:(float)rate {
    CGFloat range = AVSpeechUtteranceMaximumSpeechRate - AVSpeechUtteranceMinimumSpeechRate;
    self.rate = AVSpeechUtteranceMinimumSpeechRate + rate * range;
    return YES;
}

-(BOOL) setLanguage:(NSString*) locale {
    if([self isLanguageAvailable:locale]){
        self.locale = locale;
        return YES;
    }
    return NO;
}

-(NSArray*) getLanguages {
    NSMutableArray* languages = [[NSMutableArray alloc] init];
    for (AVSpeechSynthesisVoice* voice in [AVSpeechSynthesisVoice speechVoices]) {
        [languages addObject:voice.language];
    }
    NSArray *arr = [languages copy];
    return arr;
    
}

-(void)speak:(NSString*) text {
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:text];
    utterance.rate = self.rate;
    if(self.locale != nil){
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:self.locale];
        utterance.voice = voice;
    }
    [self.speechSynthesizer speakUtterance:utterance];
}

-(void)speakDuration:(NSTimeInterval) duration {
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:@""];
    utterance.rate = self.rate;
    utterance.preUtteranceDelay = duration;
    utterance.volume = 0;
    if(self.locale != nil) {
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:self.locale];
        utterance.voice = voice;
    }
    [self.speechSynthesizer speakUtterance:utterance];
}

-(void)stop {
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

-(void)shutdown {
    if (self.speechSynthesizer != nil) {
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}
@end

