#import <Flutter/Flutter.h>
@import AVFoundation;

@interface FlutterPluginTtsPlugin : NSObject<FlutterPlugin>
@property (readwrite, nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;
@property (strong) NSString *locale;
@property (assign) float rate;
@end
