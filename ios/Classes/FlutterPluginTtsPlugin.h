#import <Flutter/Flutter.h>
@import AVFoundation;

@interface FlutterPluginTtsPlugin : NSObject<FlutterPlugin>
@property (readwrite, nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;
@property (readwrite, nonatomic, strong) AVSpeechUtterance *speechUtterance;
@property (strong) NSString *locale;
@property (assign) float rate;
@end

