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
                      
                  NSString *sss = @"{\"id\":1,\"title\":\"tttitttleios\"}";
         
            result(sss);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    [GeneratedPluginRegistrant  registerWithRegistry:self];
    return [super  application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSString *)description {
// NSString *s1 = @"avant";
// NSString *s2 = @"avan2t";
   return [NSString stringWithFormat: @"{\"id\": 1,\"title\": \"titttle - ios\"}"];
}

- (NSString *)helloFromNativeCode {
    
    NSString *s = @"avant";
    s = [s stringByAppendingString:@" - après"];
    NSLog(@"%@", s);
    
    
    return  @"Hi From Native IOS Code ";
}


@end

