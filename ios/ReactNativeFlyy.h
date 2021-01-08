#import <React/RCTBridgeModule.h>
#import "WebViewController.h"

@interface ReactNativeFlyy : NSObject <RCTBridgeModule>

- (void)set_navigation_controller:(UINavigationController*)navigation  withCurrentViewController:(UIViewController*) controller;

@end
