#import "ReactNativeFlyy.h"
#import "FlyyFramework/FlyyFramework.h"
#import "ReactNativeFlyy-Swift.h"

@implementation ReactNativeFlyy

// To export a module named ReactNativeFlyy
RCT_EXPORT_MODULE(Flyy)

static NSString * STAGE = @"STAGE";
static NSString * PRODUCTION = @"PRODUCTION";

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
    //Instance of flyy class
    
        FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
//    [flyyHelper openPa]
    
    //Initialize sdk
    //    [flyyInstance openOffersPageWithNavigationController:];
}

//open rewards screen
RCT_EXPORT_METHOD(openRewardsScreen)
{
    //Instance of flyy class
    //    FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
    
    //Initialize sdk
    //    [flyyInstance openOffersPageWithNavigationController:];
}

//open wallet screen
RCT_EXPORT_METHOD(openWalletScreen)
{
    //Instance of flyy class
    //    FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
    
    //Initialize sdk
    //    [flyyInstance openOffersPageWithNavigationController:];
}

//open gift cards screen
RCT_EXPORT_METHOD(openGiftCardScreen)
{
    //Instance of flyy class
    //    FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
    
    //Initialize sdk
    //    [flyyInstance openOffersPageWithNavigationController:];
}

//open referral history screen
RCT_EXPORT_METHOD(openReferralHistory)
{
    //Instance of flyy class
    //    FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
    
    //Initialize sdk
    //    [flyyInstance openOffersPageWithNavigationController:];
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
