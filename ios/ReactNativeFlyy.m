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

//Init flyy sdk with referral callback
RCT_EXPORT_METHOD(initSDKWithReferralCallback: (NSString *)partnerToken :(int)environment :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance initSDKWithPartnerToken:partnerToken environment: environment onComplete: ^(BOOL success, NSString * referralData) {
        if(success) {
            callback(@[referralData]);
        }
    }];
}

//Init flyy sdk with theme colors
RCT_EXPORT_METHOD(initSDKWithThemeColors: (NSString *)partnerToken :(int)environment
                  :(NSString *)colorPrimary :(NSString *)colorPrimaryDark)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance initSDKWithPartnerToken:partnerToken environment:environment themeColorPrimary:colorPrimary themeColorPrimaryDark:colorPrimaryDark];
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
            callback(@[@("success")]);
        }
    }];
}

//set user with segmentId callback
RCT_EXPORT_METHOD(setUserWithSegment: (NSString *)userId :(NSString *)segmentId :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setUserWithExternalUserId:userId segmentId:segmentId onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("success")]);
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
            callback(@[@("success")]);
        }
    }];
}

//set new user with segmentId callback
RCT_EXPORT_METHOD(setNewUserWithSegment: (NSString *)userId :(NSString *)segmentId :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setNewUserWithExternalUserId:userId segmentId:segmentId onComplete: ^(BOOL success) {
        if(success) {
            callback(@[@("success")]);
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
            callback(@[@("success")]);
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
            callback(@[@("success")]);
        }
    }];
}

//set redemption details
RCT_EXPORT_METHOD(setRedemptionDetails: (NSString *)accountType :(NSString *)accountNumber :(NSString *)ifscCode
                  :(NSString *)name :(NSString *)upiId)
{
    //TODO to be implemented later
}

//set bank details
RCT_EXPORT_METHOD(setBankDetails: (NSString *)accountNumber :(NSString *)ifscCode
                  :(NSString *)name)
{
    //TODO to be implemented later
}

//set upi details
RCT_EXPORT_METHOD(setUPIDetails: (NSString *)upiId)
{
    //TODO to be implemented later
}

//set upi details
RCT_EXPORT_METHOD(logout)
{
    //TODO to be implemented later
}

//add user to segment
RCT_EXPORT_METHOD(addUserToSegment: (NSString *)segmentTitle withString:(NSString *)segmentKey)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance addUserToSegmentWithSegmentTitle:segmentTitle segmentKey:segmentKey onComplete: ^(BOOL success) {
        if(success) {
            //            callback(@[@("success")]);
        }
    }];
}

//show notification pop up
RCT_EXPORT_METHOD(showNotificationPopup: (int)notificationId :(NSString *)title :(NSString *)message :(NSString *)bigImage :(NSString *)deeplink :(int)campaignId) {
    //TODO to be implemented later
}

//show reward won popup
RCT_EXPORT_METHOD(showRewardWonPopup: (NSString *)title :(NSString *)message :(NSString *)deeplink :(NSString *)buttonText) {
    //TODO to be implemented later
}

//show reward won scratch popup
RCT_EXPORT_METHOD(showRewardWonScratchPopup: (NSString *)title :(NSString *)message :(bool *)showConfetti :(NSString *)refNum) {
    //TODO to be implemented later
}

//set referral code
RCT_EXPORT_METHOD(setReferralCode: (NSString *)referralCode) {
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    [flyyInstance setReferralCodeWithReferralCode:referralCode];
}

//set segement id
RCT_EXPORT_METHOD(setSegmentId: (NSString *)segmentId) {
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance setSegmentIdWithSegementId:segmentId];
}

//set user with callback
RCT_EXPORT_METHOD(verifyReferralCode: (NSString *)referralCode :(RCTResponseSenderBlock)callback)
{
    //Instance of flyy class
    Flyy *flyyInstance = [[Flyy alloc] init];
    
    [flyyInstance verifyReferralCodeWithReferralCode:referralCode onComplete:^(bool isValid, NSString* referralUrl) {
        if (isValid) {
            callback(@[@"true", referralUrl]);
        } else {
            callback(@[@"false", referralUrl]);
        }
    }];
}

//open offers screen
RCT_EXPORT_METHOD(openOffersScreen)
{
    [self naviagteToPage:@"Loading Offers..." :@"https://web-sdk.theflyy.com/" :@""];
}

//open offers screen with segemnt id
RCT_EXPORT_METHOD(openOffersScreenWithSegment: (NSString *)segmentId)
{
    [self naviagteToPage:@"Loading Offers..." :@"https://web-sdk.theflyy.com/" :segmentId];
}

//open rewards screen
RCT_EXPORT_METHOD(openRewardsScreen)
{
    [self naviagteToPage:@"Loading Rewards..." :@"https://web-sdk.theflyy.com/rewards" :@""];
}

//open wallet screen
RCT_EXPORT_METHOD(openWalletScreen)
{
    [self naviagteToPage:@"Loading Wallet..." :@"https://web-sdk.theflyy.com/wallet" :@""];
}

//open gift cards screen
RCT_EXPORT_METHOD(openGiftCardScreen)
{
    [self naviagteToPage:@"Loading Gift Cards..." :@"https://web-sdk.theflyy.com/gift-cards" :@""];
}

//open referral history screen
RCT_EXPORT_METHOD(openReferralHistory)
{
    [self naviagteToPage:@"Loading Referrals..." :@"https://web-sdk.theflyy.com/referrals" :@""];
}

//open quiz screen
RCT_EXPORT_METHOD(openFlyyQuizPage)
{
    
}

//open quiz history screen
RCT_EXPORT_METHOD(openFlyyQuizHistoryPage)
{
    
}

//open quiz list screen
RCT_EXPORT_METHOD(openFlyyQuizListPage)
{
    
}

//open stamps screen
RCT_EXPORT_METHOD(openFlyyStampsPage)
{
    
}

//open stamps screen
RCT_EXPORT_METHOD(openFlyyInviteDetailsPage)
{
    
}

- (void) naviagteToPage :(NSString *)pageTitle :(NSString *)pageurl :(NSString *)segmentId {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
            WebViewController *webViewController = [[WebViewController alloc] init];
            webViewController.pageLoadingTitle = pageTitle;
            webViewController.pageUrl = pageurl;
            webViewController.segmentId = segmentId;
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
