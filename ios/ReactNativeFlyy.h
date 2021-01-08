#import <React/RCTBridgeModule.h>
#import "WebVC.h"

@interface ReactNativeFlyy : NSObject <RCTBridgeModule>

- (void)login_method_called:(UINavigationController*)navigation  withCurrentViewController:(UIViewController*) controller;

@end
