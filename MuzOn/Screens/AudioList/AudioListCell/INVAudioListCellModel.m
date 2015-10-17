//
//  INVAudioListCellModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListCellModel.h"
#import <VKAudio.h>
#import "INVAudio.h"

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

-(instancetype)initWithINVAudio:(INVAudio *)audio{
    if (self == [super init]) {
        if (audio) {
            self.titleAudio = [NSString stringWithString: audio.titleAudio];
            self.duration = [NSString stringWithFormat:@"%@", audio.duration];
            self.urlAudio = [NSURL URLWithString:audio.urlFIle];
            self.artist = [NSString stringWithString: audio.artist];
            self.audioObject = audio;
        }
    }
    return self;
}
@end
