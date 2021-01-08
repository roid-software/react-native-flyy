#import "ReactNativeFlyy.h"
#import "FlyyFramework/FlyyFramework.h"
#import "WebVC.h"

@implementation ReactNativeFlyy : NSObject


// To export a module named ReactNativeFlyy
RCT_EXPORT_MODULE(Flyy)

static NSString * STAGE = @"STAGE";
static NSString * PRODUCTION = @"PRODUCTION";

-(void)login_method_called:(UINavigationController*)navigation  withCurrentViewController:(UIViewController*) controller
{
   [navigation pushViewController:controller animated:YES];
}

RCT_EXPORT_METHOD(initSDK: (NSString *)partnerToken :(int)environment)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    //Initialize sdk
    [flyyInstance initSDKWithPartnerToken:partnerToken environment: environment];
}

RCT_EXPORT_METHOD(setUser: (NSString *)userId)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    //Initialize sdk
    [flyyInstance setUserWithExternalUserId:userId];
}

RCT_EXPORT_METHOD(setUserName: (NSString *)userName)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    //Initialize sdk
    [flyyInstance setUserNameWithUserName:userName];
}

RCT_EXPORT_METHOD(openOffersScreen)
{
   // call on Main thread
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        dispatch_async(dispatch_get_main_queue(), ^(){
            
            UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
            WebVC *home = [[WebVC alloc] init];
            [navController pushViewController:home animated:YES];
        });
    });    
}

- (NSDictionary *)constantsToExport
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    return @{
        STAGE: [NSNumber numberWithInt:[flyyInstance staging]],
        PRODUCTION: [NSNumber numberWithInt:[flyyInstance production]],
    };
}

@end
