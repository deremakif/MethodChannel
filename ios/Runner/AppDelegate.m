#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"



@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* nativeChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"com.methodchannel/test"
                                           binaryMessenger:controller];
    
    [nativeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {             
        
        if ([@"getModel"  isEqualToString:call.method]) {
            
            NSString* title = call.arguments[@"title"];
            title = [title stringByAppendingString:@" is coming from dart!"];
            NSString *result = @"{\"id\":1,\"title\":\"";
            result = [result stringByAppendingString:title];
            result = [result stringByAppendingString:@"\"}"];    
        
            result(result);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    [GeneratedPluginRegistrant  registerWithRegistry:self];
    return [super  application:application didFinishLaunchingWithOptions:launchOptions];
}



@end

