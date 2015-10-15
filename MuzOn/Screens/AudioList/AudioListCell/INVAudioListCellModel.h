//
//  INVAudioListCellModel.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VKAudio;

@interface INVAudioListCellModel : NSObject

@property(copy, nonatomic)      NSString *titleAudio;
@property(copy, nonatomic)      NSString *artist;
@property(copy, nonatomic)      NSString *duration;
@property(strong, nonatomic)    NSURL *urlAudio;

-(instancetype)initWithVKAudio:(VKAudio *)audio;

@end
