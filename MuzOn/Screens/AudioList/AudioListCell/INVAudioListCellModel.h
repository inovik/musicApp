//
//  INVAudioListCellModel.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class INVAudio;
@class VKAudio;


@interface INVAudioListCellModel : NSObject

@property(copy, nonatomic)      NSString *titleAudio;
@property(copy, nonatomic)      NSString *artist;
@property(copy, nonatomic)      NSString *duration;
@property(strong, nonatomic)    NSURL *urlAudio;
@property(strong, nonatomic)    INVAudio *audioObject;

-(instancetype)initWithVKAudio:(VKAudio *)audio;
-(instancetype)initWithINVAudio:(INVAudio *)audio;

@end
