#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"



@interface ModelDemo: NSObject
@property NSString* name;
@property NSString* emailId;
@end

@implementation ModelDemo
@end


@implementation AppDelegate
        - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
        FlutterMethodChannel* nativeChannel = [FlutterMethodChannel
        methodChannelWithName:@"com.methodchannel/test"
        binaryMessenger:controller];
        __weak  typeof(self) weakSelf = self;
        [nativeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
       
        NSString* text = call.arguments[@"text"];

        NSLog(@"words :: %@", text);

          NSString *s = @"Hi From Native IOS Code: ";
            s = [s stringByAppendingString:text];
            NSLog(@"%@", s);

        if ([@"greetings"  isEqualToString:call.method]) {
     
        // NSString *strNative = [weakSelf helloFromNativeCode];

// ModelDemo* model = [ModelDemo new];
// model.name = "Hello";
// NSArray<ModelDemo*>* array = @[model];
// NSLog(@"Name: %@", array[0].name);

        result(s);
        } else {
        result(FlutterMethodNotImplemented);
        }
        }];
        [GeneratedPluginRegistrant  registerWithRegistry:self];
        return [super  application:application didFinishLaunchingWithOptions:launchOptions];
        }
        - (NSString *)helloFromNativeCode {
            
            NSString *s = @"avant";
            s = [s stringByAppendingString:@" - après"];
            NSLog(@"%@", s);


        return  @"Hi From Native IOS Code ";
        }
@end

