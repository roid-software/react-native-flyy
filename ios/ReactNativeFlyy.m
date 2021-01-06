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
