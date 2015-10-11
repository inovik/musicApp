//
//  INVAudioListCellModel.h
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INVAudioListCellModel : NSObject

@property(copy, nonatomic) NSString *titleAudio;
@property(copy, nonatomic) NSString *duration;

-(instancetype)initWithDictionary:(NSDictionary *)properties;

@end
