//
//  INVAudioListCellModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListCellModel.h"
#import <VKAudio.h>

@implementation INVAudioListCellModel

-(instancetype)initWithVKAudio:(VKAudio *)audio{
    if (self == [super init]) {
        if (audio) {
            self.titleAudio = [NSString stringWithString: audio.title];
            self.duration = [NSString stringWithFormat:@"%@", audio.duration];
            self.urlAudio = [NSURL URLWithString:audio.url];
            self.artist = [NSString stringWithString: audio.artist];
        }
    }
    return self;
}
@end
