//
//  INVVKManager.h
//  MuzOn
//
//  Created by Ivan Novikov on 06.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VKResponse;

#define VKManager [INVVKManager sharedInstance]

extern NSString *const kVKAppID;

@interface INVVKManager : NSObject


@property(assign, nonatomic, getter=isLoginned) BOOL loginned;

+(instancetype) sharedInstance;
// следующие объявления сгенерируют compile time ошибки при попытке их вызвать вручную.
// добавляем -copyWithZone: -allocWithZone: -copy по вкусу
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

-(void)autorizateVKSDK;
-(void)getUserAuidioWithSuccesBlock:(void(^)(VKResponse *))succesBlock;
@end
