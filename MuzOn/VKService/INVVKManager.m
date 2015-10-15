//
//  INVVKManager.m
//  MuzOn
//
//  Created by Ivan Novikov on 06.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVVKManager.h"
#import <VK-ios-sdk/VKSdk.h>


NSString *const kVKAppID = @"5081233";

@interface INVVKManager() <VKSdkDelegate>

@end

@implementation INVVKManager

+(instancetype) sharedInstance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(BOOL)isIsLoggined{
    return [VKSdk wakeUpSession];
}

-(instancetype) initUniqueInstance {
    return [super init];
}

-(void)autorizateVKSDK{
    [VKSdk initializeWithDelegate:self andAppId:kVKAppID];

   

    if (self.loginned)
    {
        NSLog(@"we login");
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            //       [VKSdk authorize:@[VK_PER_WALL, VK_PER_EMAIL, VK_PER_AUDIO] revokeAccess:YES];
            [VKSdk authorize:@[VK_PER_WALL, VK_PER_EMAIL, VK_PER_AUDIO] revokeAccess:YES forceOAuth:NO inApp:NO];
        });
    }
}

-(BOOL)isLoginned{
    return [VKSdk wakeUpSession];
}

-(void)getUserAuidioWithSuccesBlock:(void(^)(NSDictionary *))succesBlock{
    VKRequest *audioRequest2 = [VKApi requestWithMethod:@"audio.get" andParameters:nil andHttpMethod:@"GET"];
    [audioRequest2 executeWithResultBlock:^(VKResponse *response) {
        succesBlock(response.json);
    } errorBlock:^(NSError *error) {
        NSLog(@"");
    }];
//    [audioRequest executeWithResultBlock:^(VKResponse *response) {
//       NSLog(@"%@", response.responseString);
//    } errorBlock:^(NSError *error) {
//        if (error.code != VK_API_ERROR) {
//            [error.vkError.request repeat];
//        }
//        else {
//            NSLog(@"VK error: %@", error);
//        }
//
//    }];
}

#pragma mark VKSdK delegate Methods
-(void)vkSdkReceivedNewToken:(VKAccessToken *)newToken{
//    NSLog(@"1");
}

-(void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken{
//    NSLog(@"1");
}

-(void)vkSdkUserDeniedAccess:(VKError *)authorizationError{
//    NSLog(@"1");
}

-(void)vkSdkNeedCaptchaEnter:(VKError *)captchaError{
//    NSLog(@"1");
}

-(void)vkSdkShouldPresentViewController:(UIViewController *)controller{
    
}

@end
