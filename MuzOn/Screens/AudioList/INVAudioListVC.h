//
//  INVAudioListVC.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LoadingType) {
    LoadingTypeFromServer,
    LoadingTypeFromDB
};

@interface INVAudioListVC : UIViewController

@property (assign, nonatomic) LoadingType loadingType;

@end
