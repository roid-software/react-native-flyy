#import "ReactNativeFlyy.h"
#import "FlyyFramework/FlyyFramework.h"
#import "WebViewController.h"

@implementation ReactNativeFlyy

// To export a module named Flyy
RCT_EXPORT_MODULE(Flyy)

static NSString * STAGE = @"STAGE";
static NSString * PRODUCTION = @"PRODUCTION";

-(void)set_navigation_controller:(UINavigationController*)navigation  withCurrentViewController:(UIViewController*) controller
{
   [navigation pushViewController:controller animated:YES];
}

//set package name
RCT_EXPORT_METHOD(setPackageName: (NSString *)packageName)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setPackageWithPackageName:packageName];
}

//Init flyy sdk
RCT_EXPORT_METHOD(initSDK: (NSString *)partnerToken :(int)environment)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance initSDKWithPartnerToken:partnerToken environment: environment];
}

//set user
RCT_EXPORT_METHOD(setUser: (NSString *)userId)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setUserWithExternalUserId:userId];
}

//set user with callback
RCT_EXPORT_METHOD(setUserWithCallBack: (NSString *)userId :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setUserWithExternalUserId:userId onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("Success")]);
        }
    }];
}

//set new user
RCT_EXPORT_METHOD(setNewUser: (NSString *)userId)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setNewUserWithExternalUserId:userId];
}

//set new user with callback
RCT_EXPORT_METHOD(setNewUserWithCallBack: (NSString *)userId :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setNewUserWithExternalUserId:userId onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("Success")]);
        }
    }];
}

//set username
RCT_EXPORT_METHOD(setUserName: (NSString *)userName)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setUserNameWithUserName:userName];
}

//set username with callback
RCT_EXPORT_METHOD(setUserNameWithCallBack: (NSString *)userName :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setUserNameWithUserName:userName onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("Success")]);
        }
    }];
}

//send event
RCT_EXPORT_METHOD(sendEvent: (NSString *)key withString:(NSString *)value)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance sendEventWithKey:key value:value];
}

//send event with callback
RCT_EXPORT_METHOD(sendEventWithCallBack: (NSString *)key withString:(NSString *)value :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance sendEventWithKey:key value:value onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("Success")]);
        }
    }];
}

////send event
//RCT_EXPORT_METHOD(sendEvent: (NSString *)key withJsonObject:(NSDictionary *) jsonObject)
//{
//    //Instance of flyy class
//    Flyy *flyyInstance = [[Flyy alloc] init];
//
//    NSError *writeError = nil;
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&writeError];
//
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//
//    [flyyInstance sendEventWithKey:key value:jsonString];
//}

////send event with callback
//RCT_EXPORT_METHOD(sendEventWithCallBack: (NSString *)key withJsonObject:(NSDictionary *) jsonObject :(RCTResponseSenderBlock)callback)
//{
//    //Instance of flyy class
//    Flyy *flyyInstance = [[Flyy alloc] init];
//    
//    NSError *writeError = nil;
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&writeError];
//    
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    
//    [flyyInstance sendEventWithKey:key value:jsonString onComplete: ^(BOOL success) {
//        if(success) {
//            callback(@[@("Success")]);
//        }
//    }];
//}

//open offers screen
RCT_EXPORT_METHOD(openOffersScreen)
{
    [self naviagteToPage:@"Loading Offers..." :@"https://web-sdk.theflyy.com/"];
}

//open rewards screen
RCT_EXPORT_METHOD(openRewardsScreen)
{
    [self naviagteToPage:@"Loading Rewards..." :@"https://web-sdk.theflyy.com/rewards"];
}

//open wallet screen
RCT_EXPORT_METHOD(openWalletScreen)
{
    [self naviagteToPage:@"Loading Wallet..." :@"https://web-sdk.theflyy.com/wallet"];
}

//open gift cards screen
RCT_EXPORT_METHOD(openGiftCardScreen)
{
    [self naviagteToPage:@"Loading Gift Cards..." :@"https://web-sdk.theflyy.com/gift-cards"];
}

//open referral history screen
RCT_EXPORT_METHOD(openReferralHistory)
{
    [self naviagteToPage:@"Loading Referrals..." :@"https://web-sdk.theflyy.com/referrals"];
}

- (void) naviagteToPage :(NSString *)pageTitle :(NSString *)pageurl{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        dispatch_async(dispatch_get_main_queue(), ^(){

            UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
            WebViewController *webViewController = [[WebViewController alloc] init];
            webViewController.pageLoadingTitle = pageTitle;
            webViewController.pageUrl = pageurl;
            [navController pushViewController:webViewController animated:YES];
        });
    });
}

//overriden method to expose all the constants
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
