//
//  INVAudioListCellModel.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListCellModel.h"

@implementation INVAudioListCellModel

-(instancetype)initWithDictionary:(NSDictionary *)properties{
    if (self == [super init]) {
        if (properties) {
            self.titleAudio = [NSString stringWithFormat:@"%@ - %@", properties[@"title"], properties[@"artist"]];
            self.duration = [NSString stringWithFormat:@"%@", properties[@"duration"]];
        }
    }
    return self;
}
@end
