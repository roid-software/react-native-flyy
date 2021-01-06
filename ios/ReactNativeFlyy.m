#import "ReactNativeFlyy.h"
#import "FlyyFramework/FlyyFramework.h"


@implementation ReactNativeFlyy

// To export a module named ReactNativeFlyy
RCT_EXPORT_MODULE(Flyy)

static NSString * STAGE = @"STAGE";
static NSString * PRODUCTION = @"PRODUCTION";

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
    //Instance of flyy class
//    FlyyHelper *flyyHelper = [[FlyyHelper alloc] init];
    
    //Initialize sdk
//    [flyyInstance openOffersPageWithNavigationController:];
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
